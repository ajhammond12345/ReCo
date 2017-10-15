//
//  Picture.m
//  ReCo
//
//  Created by Alexander Hammond on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "Picture.h"
#import "Utility.h"

@implementation Picture

-(void) uploadImage {
    NSError *error;
    NSMutableDictionary *tmpDic = [[NSMutableDictionary alloc] init];
    NSString *imageBase64 = [_picData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    //NSLog(@"Upload Data: %@", imageBase64);
    [tmpDic setObject:imageBase64 forKey:@"va_image_data"];
    [tmpDic setObject:[NSNumber numberWithBool:_isBefore] forKey:@"picture_is_before"];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:tmpDic options:NSJSONWritingPrettyPrinted error:&error];
    //logs the data to check if it is created successfully
    NSLog(@"%@", [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    
    //creates url for the request
    
    //production url
    NSURL *url = [NSURL URLWithString:@"https://localhost:3001/pictures.json"];
    //testing url
    //NSURL *url = [NSURL URLWithString:@"http://localhost:3001/items.json"];
    
    //creates a URL request
    NSMutableURLRequest *uploadRequest = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    //specifics for the request (it is a post request with json content)
    [uploadRequest setHTTPMethod:@"POST"];
    [uploadRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [uploadRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [uploadRequest setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[jsonData length]] forHTTPHeaderField:@"Content-Length"];
    [uploadRequest setHTTPBody: jsonData];
    
    //create some type of waiting image here
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    //runs the data task
    [[session dataTaskWithRequest:uploadRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *requestReply = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
            NSLog(@"requestReply: %@", [[requestReply class] description]);
            //if the result has the class type __NSCFConstantString then the item failed to upload
            if ([[[requestReply class] description] isEqualToString:@"__NSCFConstantString"]) {
                //alert for failing to upload
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"No Connection\n" message:@"Could not donate the item. Please check your internet connection and try again." preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
                [alert addAction:defaultAction];
                [Utility throwAlertWithTitle:@"No Connection" message:@"Could Not Upload the Image." sender:self];
            }
        });
    }] resume];
}

@end

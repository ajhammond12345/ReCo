//
//  SendCommunication.m
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "SendCommunication.h"
#import "Notification.h"

@interface SendCommunication () <UITextFieldDelegate>

@end

@implementation SendCommunication

-(IBAction)back:(id)sender{
    if (_isManager){
        [self performSegueWithIdentifier:@"toPropertyView" sender:self];
    } else {
        [self performSegueWithIdentifier:@"toRenterHome" sender:self];
    }
}
-(IBAction)send:(id)sender{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    titleInput.delegate = self;
    bodyInput.delegate = self;
    // Do any additional setup after loading the view.
}

-(IBAction)addNotification:(id)sender {
    [self.view endEditing:YES];
    _title1 = titleInput.text;
    _body = titleInput.text;
    if ([_title1 isEqualToString:@""]
        || [_body isEqualToString:@""]) {
        NSString *errorMessage;
        if ([_title1 isEqualToString:@""]) {
            errorMessage = @"Please put in title for this message";
        }
        else if ([_body isEqualToString:@""]) {
            errorMessage = @"Please put in body for this message";
        }
        else {
            errorMessage = @"Sorry we are unable to save a new notification for you at this time. Please try again later.";
        }
        //shows error message for missing information
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Missing Information" message:errorMessage preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    //if all information present
    else {
        //closes keyboards
        [self.view endEditing:YES];
        //creates the Item object
        Notification *newNotification = [[Notification alloc] init];
        newNotification.title = _title1;
        newNotification.text = _body;
        [newNotification setLocalDictionary];
        //creates error handler
        NSError *error;
        
        //creates mutable copy of the dictionary to remove extra keys
        NSMutableDictionary *tmpDic = [newNotification.localDictionary mutableCopy];
        
        //JSON Upload - does not upload the image
        //converts the dictionary to json
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:tmpDic options:NSJSONWritingPrettyPrinted error:&error];
        //logs the data to check if it is created successfully
        NSLog(@"%@", [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
        
        //production url
        NSURL *url = [NSURL URLWithString:@"https://localhost:3001/Notifications.json"];

        //creates a URL request
        NSMutableURLRequest *uploadRequest = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
        //specifics for the request (it is a post request with json content)
        [uploadRequest setHTTPMethod:@"POST"];
        [uploadRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [uploadRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [uploadRequest setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[jsonData length]]forHTTPHeaderField:@"Content-Length"];
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
                    [self presentViewController:alert animated:YES completion:nil];
                }
                else {
                    [self performSegueWithIdentifier:@"toManagerHome" sender:self];
                }
            });
        }] resume];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

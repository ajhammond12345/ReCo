//
//  CreateProperty.m
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "CreateProperty.h"
#import "Property.h"

@interface CreateProperty () <UITextFieldDelegate, UIImagePickerControllerDelegate>

@end

@implementation CreateProperty

-(IBAction)addAvatarPhoto:(id)sender {
    _isAvatarImage = true;
    [self addPhoto:self];
}

-(IBAction)addBeforePhoto:(id)sender {
    _isAvatarImage = false;
    [self addPhoto:self];
}

-(void)addPhoto:(id)sender {
    //creates image picker
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    //lets user choose camera or photo library
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    //camera action
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //initiates picker with camera
        [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
        [self presentViewController:picker animated:true completion:nil];
    }];
    //photo library action
    UIAlertAction *photoAlbum = [UIAlertAction actionWithTitle:@"Photo Library" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //initiates picker with photo library
        [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [self presentViewController:picker animated:true completion:nil];
    }];
    //cancel action
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}];
    //adds all of the actions
    [alert addAction:camera];
    [alert addAction:photoAlbum];
    [alert addAction:cancel];
    //presents the options
    [self presentViewController:alert animated:true completion:nil];
}

//delegate methods for image picker
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    //saves the selected image to the image field
    UIImage *tmpImage = info[UIImagePickerControllerEditedImage];
    _avatar = tmpImage;
    NSString * documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    if (_isAvatarImage) {
        [self saveImage:tmpImage withFileName:@"avatarPhoto" ofType:@"jpg" inDirectory:documentsDirectory];
        houseAvatar.image = tmpImage;
        houseAvatar.hidden = NO;
        uploadAvatar.hidden = YES;
        [picker dismissViewControllerAnimated:YES completion:NULL];
    }
    else {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSNumber *imageCount = [defaults objectForKey:@"image_count"];
        int count = [imageCount intValue];
        [self saveImage:tmpImage withFileName:[NSString stringWithFormat:@"beforePhoto%i",count] ofType:@"jpg" inDirectory:documentsDirectory];
        [_beforePhotos addObject:UIImagePNGRepresentation(tmpImage)];
    }
    
}


//Image saving/loading methods from Fernando Cervantes on Stack Overflow
-(void)saveImage:(UIImage *)image withFileName:(NSString *)imageName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath {
    if ([[extension lowercaseString] isEqualToString:@"png"]) {
        [UIImagePNGRepresentation(image) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"png"]] options:NSAtomicWrite error:nil];
    } else if ([[extension lowercaseString] isEqualToString:@"jpg"] || [[extension lowercaseString] isEqualToString:@"jpeg"]) {
        [UIImageJPEGRepresentation(image, 1.0) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"jpg"]] options:NSAtomicWrite error:nil];
    } else {
        NSLog(@"Image Save Failed\nExtension: (%@) is not recognized, use (PNG/JPG)", extension);
    }
}

-(UIImage *)loadImageWithFileName:(NSString *)fileName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath {
    UIImage * result = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@.%@", directoryPath, fileName, [extension lowercaseString]]];
    if (result) {
        return result;
    }
    else {
        return [UIImage imageNamed:@"userlogo.png"];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

//for the text fields that are directly edited (name and price)
-(void)textFieldDidEndEditing:(UITextField *)textField {
    //if user was editting price it updates the price field and formats the input to be displayed in the text field
    if ([textField isEqual: inputRent]) {
        NSString *cents;
        NSString *dollars;
        int priceCents;
        int priceDollars;
        //formatting input
        for (int i = 0; i < inputRent.text.length; i++) {
            if ([[[inputRent.text substringFromIndex:i] substringToIndex:1] isEqualToString:@"."]) {
                cents = [inputRent.text substringFromIndex:i];
                dollars = [inputRent.text substringToIndex:i];
                break;
            }
        }
        if (dollars == nil) {
            dollars = inputRent.text;
            if ([dollars isEqualToString:@""]) {
                dollars = @"0";
            }
        }
        if (cents == nil) {
            cents = @".00";
        }
        NSCharacterSet *mySet = [NSCharacterSet characterSetWithCharactersInString:@"."];
        cents = [cents stringByTrimmingCharactersInSet:mySet];
        if (cents.length == 1) {
            [cents stringByAppendingString:@"0"];
        }
        priceCents = (int)[cents integerValue];
        dollars = [dollars stringByTrimmingCharactersInSet:mySet];
        priceDollars = (int)[dollars integerValue];
        NSLog(@"Price: %@%i", dollars, priceDollars);
        //saving input
        _rentInCents = (priceDollars * 100) + priceCents;
        NSLog(@"%zd", _rentInCents);
        //outputting formatted input
        inputRent.text = [NSString stringWithFormat:@"$%@.%@", dollars, cents];
        if ([inputRent.text isEqualToString:@"$0.00"]) {
            inputRent.text = @"";
            _rentInCents = 0;
            inputRent.placeholder = @"$0.00";
        }
    }
    //closes keyboard
    [textField resignFirstResponder];
    [self.view endEditing:YES];
}


-(IBAction)addProperty:(id)sender {
    [self.view endEditing:YES];
    _address = inputAddress.text;
    //first need to check that all fields have data
    if ([_address isEqualToString:@""]
        || _rentInCents == 0) {
        NSString *errorMessage;
        if ([_address isEqualToString:@""]) {
            errorMessage = @"Please put in an address for the rental unit";
        }
        else if (rent == 0) {
            errorMessage = @"Please input a rent value for this house";
        }
        else {
            errorMessage = @"Sorry we are unable to save a new property for you at this time. Please try again later.";
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
        Property *newProperty = [[Property alloc] init];
        newProperty.address = _address;
        newProperty.avatar = _avatar;
        newProperty.rentInCents = _rentInCents;
        newProperty.beforePics = [_beforePhotos copy];
        [newProperty setPropertyDictionary];
        
        //creates error handler
        NSError *error;
        
        //creates mutable copy of the dictionary to remove extra keys
        NSMutableDictionary *tmpDic = [newProperty.localDictionary mutableCopy];
        
        //removes extra keys (item_image is replaced with a different key for the image data)
        [tmpDic removeObjectForKey:@"id"];
        [tmpDic removeObjectForKey:@"item_image"];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSNumber *userID = [defaults objectForKey:@"user_id"];
        [tmpDic setObject:userID forKey:@"user_id"];
        NSData *imageData = UIImageJPEGRepresentation(newProperty.avatar, .6);
        NSString *imageBase64 = [imageData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
        //NSLog(@"Upload Data: %@", imageBase64);
        [tmpDic setObject:imageBase64 forKey:@"va_image_data"];;
        
        //JSON Upload - does not upload the image
        //converts the dictionary to json
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:tmpDic options:NSJSONWritingPrettyPrinted error:&error];
        //logs the data to check if it is created successfully
        NSLog(@"%@", [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
        
        //creates url for the request
        
        //production url
        NSURL *url = [NSURL URLWithString:@"https://murmuring-everglades-79720.herokuapp.com/items.json"];
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
                    [self presentViewController:alert animated:YES completion:nil];
                }
                else {
                    [self performSegueWithIdentifier:@"toManagerHome" sender:self];
                }
            });
        }] resume];
    }
}


-(IBAction)back:(id)sender{
    [self performSegueWithIdentifier:@"toManagerHome" sender:self];

}




- (void)viewDidLoad {
    [super viewDidLoad];
    inputAddress.delegate = self;
    inputRent.delegate = self;
    houseAvatar.hidden = YES;
    // Do any additional setup after loading the view.
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

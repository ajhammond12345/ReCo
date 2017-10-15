//
//  RenterNoProperty.m
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "RenterNoProperty.h"

@interface RenterNoProperty () <UITextFieldDelegate, UIImagePickerControllerDelegate>

@end

@implementation RenterNoProperty


-(IBAction)continues:(id)sender {
    //check if it is valid, save locally the property
    NSString *input = houseField.text;
    NSString *uniqueManagerId = [input substringToIndex:7];
    [self performSegueWithIdentifier:@"toRenterHome" sender:self];
}
-(IBAction)uploadContract:(id)sender {
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
    [_contractImages addObject:tmpImage];
    contractImage.image = tmpImage;
    contractImage.hidden = NO;
    [picker dismissViewControllerAnimated:YES completion:NULL];
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

- (void)viewDidLoad {
    [super viewDidLoad];
    contractImage.hidden = YES;
    houseField.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(int)getPropertyIdFromString:(NSString *)mystring{
    
    NSString *finalEight = [mystring substringFromIndex: 9];
    NSInteger lastEight = [finalEight integerValue];
    return lastEight;

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

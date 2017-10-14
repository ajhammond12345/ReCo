//
//  CreateProperty.h
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateProperty : UIViewController <UITextFieldDelegate>{
    
    IBOutlet UILabel *address;
    IBOutlet UITextField *inputAddress;
    IBOutlet UIButton *uploadAvatar;
    IBOutlet UIButton *uploadPictures;
    IBOutlet UILabel *rent;
    IBOutlet UITextField *inputRent;
    IBOutlet UIButton *back;
    IBOutlet UIButton *addProperty;
    IBOutlet UIImageView *houseAvatar;
    
}

@property NSString *address;
@property int rentInCents;
@property UIImage *avatar;
@property NSMutableArray *beforePhotos;

@property bool isAvatarImage;

-(IBAction)back:(id)sender;
-(IBAction)addProperty:(id)sender;

@end

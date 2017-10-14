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

}

-(IBAction)back:(id)sender;
-(IBAction)addProperty:(id)sender;

@end

//
//  ViewController.h
//  ReCo
//
//  Created by Alexander Hammond on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate> {
    
    IBOutlet UILabel *registration;
    IBOutlet UIButton *manager;
    IBOutlet UIButton *renter;
    IBOutlet UILabel *user;
    IBOutlet UITextField *username;
    IBOutlet UIButton *next;
    IBOutlet UILabel *pass;
    IBOutlet UITextField *password;
    IBOutlet UIButton *next1;
    IBOutlet UILabel *name;
    IBOutlet UITextField *legalName;
    IBOutlet UILabel *Email;
    IBOutlet UITextField *EmailAddress;
    IBOutlet UILabel *phone;
    IBOutlet UITextField *phoneNumber;
    IBOutlet UIButton *next2;
}


@end


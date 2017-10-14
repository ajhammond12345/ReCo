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
    IBOutlet UITextField *usernameTextField;
    IBOutlet UIButton *next;
    IBOutlet UILabel *pass;
    IBOutlet UITextField *passwordTextField;
    IBOutlet UIButton *next1;
    IBOutlet UILabel *name;
    IBOutlet UITextField *legalName;
    IBOutlet UILabel *Email;
    IBOutlet UITextField *EmailAddress;
    IBOutlet UILabel *phone;
    IBOutlet UITextField *phoneNumber;
    IBOutlet UIButton *next2;
    IBOutlet UITextField *passwordVerification;
}

@property NSDictionary *result;
@property NSArray *requestResult;
@property bool usernameUnique;
@property bool emailUnique;
@property bool isPM;
@property NSString *username;
@property NSString *password;
@property NSString *passwordCheck;
@property NSString *name;
@property NSString *email;
@property NSString *phoneNumber;

-(IBAction)propertyManager:(id)sender;
-(IBAction)tenant:(id)sender;


@end


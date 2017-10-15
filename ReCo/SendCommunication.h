//
//  SendCommunication.h
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SendCommunication : UIViewController <UITextFieldDelegate>{
    
    IBOutlet UITextField *titleInput;
    IBOutlet UITextField *bodyInput;
    IBOutlet UIButton *send;
    IBOutlet UIButton *back;
}

@property bool isManager;


-(IBAction)back:(id)sender;
-(IBAction)send:(id)sender;
@property NSString *title1;
@property NSString *body;



@end

//
//  SendCommunication.h
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SendCommunication : UIViewController {
    
    IBOutlet UITextField *title;
    IBOutlet UITextField *body;
    IBOutlet UIButton *send;
    IBOutlet UIButton *back;
}

@property bool isManager;
-(IBAction)back:(id)sender;
-(IBAction)send:(id)sender;


@end

//
//  AddExpense.h
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddExpense : UIViewController {
    IBOutlet UITextField *amount;
    IBOutlet UITextField *reason;
    IBOutlet UIButton *submit;
    IBOutlet UIButton *back;
}

-(IBAction)back:(id)sender;
-(IBAction)submit:(id)sender;


@end

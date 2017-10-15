//
//  AddExpense.h
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddExpense : UIViewController {
    IBOutlet UITextField *amountInput;
    IBOutlet UITextField *reasonInput;
    IBOutlet UIButton *submit;
    IBOutlet UIButton *back;
}

-(IBAction)back:(id)sender;
-(IBAction)submit:(id)sender;
@property int *amount;
@property NSString *reason;

@end

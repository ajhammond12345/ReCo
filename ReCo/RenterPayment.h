//
//  RenterPayment.h
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RenterPayment : UIViewController {
    IBOutlet UILabel *payment;
    IBOutlet UILabel *amount;
    IBOutlet UILabel *userAmount;
    IBOutlet UILabel *dueBy;
    IBOutlet UILabel *userDueBy;
    IBOutlet UILabel *paid;
    IBOutlet UILabel *userPaid;
    IBOutlet UIButton *payNow;
    IBOutlet UIButton *back;


}

@end

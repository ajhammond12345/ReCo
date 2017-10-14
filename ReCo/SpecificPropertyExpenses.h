//
//  SpecificPropertyExpenses.h
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpecificPropertyExpenses : UIViewController {
    
    /*these are all labeled assuming this is a revenue, not an expense*/
    IBOutlet UILabel *addressLabel;
    IBOutlet UILabel *UserAddress;
    IBOutlet UILabel *dateDue;
    IBOutlet UILabel *UserDateDue;
    IBOutlet UILabel *datePaid;
    IBOutlet UILabel *UserDatePaid;
    IBOutlet UILabel *amountPaid;
    IBOutlet UILabel *UserAmountPaid;
}

@end

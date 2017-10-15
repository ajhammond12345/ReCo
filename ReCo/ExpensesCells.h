//
//  ExpensesCells.h
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Expense.h"

@interface ExpensesCells : UITableViewCell{
    IBOutlet UILabel *amount;
    IBOutlet UILabel *date;

}

@property Expense *expense;
-(void)updateCell;

@end

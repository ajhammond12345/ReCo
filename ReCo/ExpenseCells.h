//
//  ExpenseCells.h
//  ReCo
//
//  Created by Alexander Hammond on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Expense.h"

@interface ExpenseCells : UITableViewCell

Expense *expense;
-(void)updateCell;

@end

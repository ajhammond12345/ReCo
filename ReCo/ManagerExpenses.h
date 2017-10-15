//
//  ManagerExpenses.h
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManagerExpenses : UIViewController <UITableViewDataSource,UITableViewDelegate>{
    
    IBOutlet UIButton *back;
    IBOutlet UILabel *expenses;
    IBOutlet UITableView *expensesTable;
}

@property NSArray *expenseList;
@property Expense *expenseToSend;
-(void)toSpecificPropertyExpenses;
-(IBAction)back:(id)sender;

@end

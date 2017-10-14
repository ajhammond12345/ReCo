//
//  ManagerExpenses.h
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManagerExpenses : UIViewController {
    
    IBOutlet UIButton *back;
    IBOutlet UILabel *expenses;
    IBOutlet UITableView *expensesTable;
    IBOutlet UITableViewCell *cell;
}

-(void)toSpecificPropertyExpenses;
-(IBAction)back:(id)sender;

@end

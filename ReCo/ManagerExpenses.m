//
//  ManagerExpenses.m
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "ManagerExpenses.h"
#import "ExpenseCells.h"
#import "Expense.h"

@interface ManagerExpenses ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ManagerExpenses

-(void)toSpecificPropertyExpenses{
    [self performSegueWithIdentifier:@"toSpecificPropertyExpenses" sender:self];
}
-(IBAction)back:(id)sender{
    [self performSegueWithIdentifier:@"toManagerHome" sender:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    expensesTable.delegate = self;
    expensesTable.dataSource = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





//delegate method used to load table view
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ExpenseCells *cell = (ExpenseCells *)[tableView dequeueReusableCellWithIdentifier:@"ExpCell" forIndexPath:indexPath];
    cell.expense = [_expenseList objectAtIndex:indexPath.row];
    //updates the views in the cell
    [cell updateCell];
        
        return cell;
}

//provides the number of rows that will be in table view (just a count of the array)
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        
    return _contractList.count;
}









/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  ManagerExpenses.m
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "ManagerExpenses.h"
#import "ExpensesCells.h"


@interface ManagerExpenses ()<UITableViewDataSource,UITableViewDelegate, NSURLSessionDelegate>

@end

@implementation ManagerExpenses

-(void)toSpecificPropertyExpenses{
    [self performSegueWithIdentifier:@"toSpecificPropertyExpenses" sender:self];
}
-(IBAction)back:(id)sender{
    [self performSegueWithIdentifier:@"toManagerHome" sender:self];
}

//loads all of the items
-(void)loadAllExpenses {

    //-- Make URL request with server to load all of the items
    if (_expensesList != nil) {
        [expensesTable reloadData];
        }
    NSString *jsonUrlString = [NSString stringWithFormat:@"https://localhost:3001/expenses.json"];
    NSURL *url = [NSURL URLWithString:jsonUrlString];
    NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url];
    [dataTask resume];

}




//loads all of the items when the data task is complete
- (void)URLSession:(NSURLSession *)session
    dataTask:(NSURLSessionDataTask *)dataTask
    didReceiveData:(NSData *)data {

    NSError *error;
    _result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    //NSLog(@"Result (Length: %zd) = %@",_result.count, _result);
    //this interprets the data received a creates a bunch of items from it
    NSMutableArray *tmpExpensesArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < _result.count; i++) {
        NSDictionary *tmpDic = [_result objectAtIndex:i];
        //NSLog(@"Dictionary %@", tmpDic);
        Expense *loadExpenses = [self loadExpenseFromDictionary:tmpDic];
        //[self loadItemImage:loadItem];
        [tmpExpensesArray addObject:loadExpenses];
        }
   
    //if data receieved it saves the interpreted data to the local array
    if (tmpExpensesArray != nil) {
        _expensesList = tmpExpensesArray;
        }

    else {
        //if no data received it provides this alert
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"No Connection\n" message:@"Could not load items" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        }
    [expensesTable reloadData];
    [session invalidateAndCancel];

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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //ExpensesCells *tmpCell = [expensesTable cellForRowAtIndexPath:indexPath];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ExpensesCells *cell = (ExpensesCells *)[tableView dequeueReusableCellWithIdentifier:@"ExpCell" forIndexPath:indexPath];
    cell.expense = [_expensesList objectAtIndex:indexPath.row];
    //updates the views in the cell
    [cell updateCell];
    return cell;
}

//provides the number of rows that will be in table view (just a count of the array)
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _expensesList.count;
}



-(Expense *)loadExpenseFromDictionary:(NSDictionary *)dic{
    Expense *myExpense = [[Expense alloc] init];
    myExpense.reason = [dic objectForKey:@"expense_reason"];
    NSNumber *myNum = [dic objectForKey:@"expense_amount"];
    myExpense.amount = [myNum intValue];
    return myExpense;
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

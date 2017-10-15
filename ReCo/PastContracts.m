//
//  PastContracts.m
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "PastContracts.h"
#import "ContractCells.h"

@interface PastContracts () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation PastContracts

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContractCells *cell = (ContractCells *)[tableView dequeueReusableCellWithIdentifier:@"PastContractCell" forIndexPath:indexPath];
    cell.contract = [_contractList objectAtIndex:indexPath.row];
    //updates the views in the cell
    [cell updateCell];
    return cell;
}

//provides the number of rows that will be in table view (just a count of the array)
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _contractList.count;
}

-(IBAction)back:(id)sender;{
    if (_isManager) {
        [self performSegueWithIdentifier:@"toManagerHome" sender:self];
    } else {
        [self performSegueWithIdentifier:@"toRenterPaperwork" sender:self];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    contractTable.delegate = self;
    contractTable.dataSource = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
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

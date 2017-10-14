//
//  ManagerHome.m
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//
#import "PropertyCells.h"
#import "ManagerHome.h"
#import "PastContracts.h"

@interface ManagerHome () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation ManagerHome

-(IBAction)addProperty:(id)sender{
    [self performSegueWithIdentifier:@"toCreateProperty" sender:self];

}
-(void)toPropertyView {
    [self performSegueWithIdentifier:@"toPropertyView" sender:self];

}
-(IBAction)expenses:(id)sender{
    [self performSegueWithIdentifier:@"toManagerExpenses" sender:self];
}
-(IBAction)contracts:(id)sender{
    [self performSegueWithIdentifier:@"toPastContracts" sender:self];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PropertyCells *tmpCell = [propertyTable cellForRowAtIndexPath:indexPath];
        _propertyToSend = tmpCell.property;
        [self performSegueWithIdentifier:@"showItem" sender:indexPath];
    }

//delegate method used to load table view
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PropertyCells *cell = (PropertyCells *)[tableView dequeueReusableCellWithIdentifier:@"propertyCell" forIndexPath:indexPath];
    cell.property = [_propertyList objectAtIndex:indexPath.row];
    //updates the views in the cell
    [cell updateCell];

    return cell;
}

//provides the number of rows that will be in table view (just a count of the array)
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        
    return _propertyList.count;
}





- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toPastContracts"]) {
        PastContracts *destViewController = segue.destinationViewController;
        destViewController.isManager = true;
    }
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    propertyTable.delegate = self;
    propertyTable.dataSource = self;
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

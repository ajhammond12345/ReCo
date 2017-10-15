//
//  RecieveCommunicationsList.m
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "RecieveCommunicationsList.h"
#import "RecieveCommunicationsSpecific.h"
#import "NotificationCells.h"


@interface RecieveCommunicationsList ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation RecieveCommunicationsList

//Notifications need to be loaded from database into _notificationsList










//delegate method used to load table view
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NotificationCells *tmpCell = [notificationTable cellForRowAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"toRecieveCommunicationsSpecific" sender:self];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NotificationCells *cell = (NotificationCells *)[tableView dequeueReusableCellWithIdentifier:@"NotificationCell" forIndexPath:indexPath];
    cell.notification = [_notificationsList objectAtIndex:indexPath.row];
    //updates the views in the cell
    [cell updateCell];
    return cell;
}

//provides the number of rows that will be in table view (just a count of the array)
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        
    return _notificationsList.count;
}



-(IBAction)back:(id)sender{
    if(_isManager){
        [self performSegueWithIdentifier:@"toPropertyView" sender:self];
    } else {
        [self performSegueWithIdentifier:@"toRenterHome" sender:self];
    }
}

/* Still need to send a parameter with this */
-(void)toReceiveCommunicationsSpecific {
    [self performSegueWithIdentifier:@"toRecieveCommunicationsSpecific" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"toRecieveCommunicationsSpecific"]) {
        
        RecieveCommunicationsSpecific *destViewController = segue.destinationViewController;
        destViewController.isManager = _isManager;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    notificationTable.delegate = self;
    notificationTable.dataSource = self;
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

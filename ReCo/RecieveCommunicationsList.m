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


@interface RecieveCommunicationsList ()<UITableViewDelegate,UITableViewDataSource, NSURLSessionDelegate>

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

//loads all of the items
-(void)loadAllNotifications {
    
    //-- Make URL request with server to load all of the items
    if (_notificationsList != nil) {
        [notificationTable reloadData];
    }
    NSString *jsonUrlString = [NSString stringWithFormat:@"https://localhost:3001/Notifications.json"];
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
    NSMutableArray *tmpNotificationArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < _result.count; i++) {
        NSDictionary *tmpDic = [_result objectAtIndex:i];
        //NSLog(@"Dictionary %@", tmpDic);
        Notification *loadNotification = [self loadNotificationFromDictionary:tmpDic];
        //[self loadItemImage:loadItem];
        [tmpNotificationArray addObject:loadNotification];
    }
    
    //if data receieved it saves the interpreted data to the local array
    if (tmpNotificationArray != nil) {
        _notificationsList = tmpNotificationArray;
    }
    
    else {
        //if no data received it provides this alert
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"No Connection\n" message:@"Could not load items" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    [notificationTable reloadData];
    [session invalidateAndCancel];
    
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

-(Notification *)loadNotificationFromDictionary:(NSDictionary *)dic{
    Notification *myNotification = [[Notification alloc] init];
    myNotification.title = [dic objectForKey:(@"notification_title")];
    myNotification.text = [dic objectForKey:(@"notification_text")];
    return myNotification;
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

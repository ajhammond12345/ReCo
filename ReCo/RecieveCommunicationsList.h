//
//  RecieveCommunicationsList.h
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Notification.h"

@interface RecieveCommunicationsList : UIViewController <UITableViewDelegate,UITableViewDataSource>{
    
    IBOutlet UILabel *notificatations;
    IBOutlet UITableView *notificationTable;
    IBOutlet UIButton *back;
    
}


-(IBAction)back:(id)sender;
-(void)toReceiveCommunicationsSpecific;
@property bool isManager;
@property NSArray *notificationsList;
@property Notification *notificationToSend;
@property NSArray *result;


@end

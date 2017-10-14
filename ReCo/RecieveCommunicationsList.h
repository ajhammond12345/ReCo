//
//  RecieveCommunicationsList.h
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecieveCommunicationsList : UIViewController {
    
    IBOutlet UILabel *notificatations;
    IBOutlet UITableView *notificationTable;
    IBOutlet UITableViewCell *cell;
    IBOutlet UIButton *back;
    
}

-(IBAction)back:(id)sender;


@end

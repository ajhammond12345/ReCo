//
//  NotificationCells.h
//  ReCo
//
//  Created by Alexander Hammond on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Notification.h"

@interface NotificationCells : UITableViewCell {
    IBOutlet UILabel *title;
    IBOutlet UILabel *text;
}

@property Notification *notification;

-(void)updateCell;

@end

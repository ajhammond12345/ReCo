//
//  ManagerHome.h
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManagerHome : UIViewController{
    
    IBOutlet UIButton *addProperty;
    IBOutlet UILabel *managerHome;
    IBOutlet UITableView *propertyTable;
    IBOutlet UITableViewCell *cell;
    IBOutlet UIButton *expenses;
    IBOutlet UIButton *contracts;
}
@end

//
//  ManagerHome.h
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManagerHome : UIViewController <UITableViewDataSource,UITableViewDelegate>{
    
    IBOutlet UIButton *addProperty;
    IBOutlet UILabel *managerHome;
    IBOutlet UITableView *propertyTable;
    IBOutlet UIButton *expenses;
    IBOutlet UIButton *contracts;
}

-(IBAction)addProperty:(id)sender;
-(void)toPropertyView;
-(IBAction)expenses:(id)sender;
-(IBAction)contracts:(id)sender;


@end

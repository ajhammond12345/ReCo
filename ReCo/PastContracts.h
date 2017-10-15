//
//  PastContracts.h
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contract.h"

@interface PastContracts : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    
    IBOutlet UILabel *pastContracts;
    IBOutlet UITableView *contractTable;
    IBOutlet UIButton *back;
}

-(IBAction)back:(id)sender;
@property bool isManager;
@property NSArray *contractList;
@property NSArray *result;
@property Contract *contractToSend;


@end

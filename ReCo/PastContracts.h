//
//  PastContracts.h
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PastContracts : UIViewController {
    
    IBOutlet UILabel *pastContracts;
    IBOutlet UITableView *contractTable;
    IBOutlet UIButton *back;
}

-(IBAction)back:(id)sender;
@property bool isManager;

@end

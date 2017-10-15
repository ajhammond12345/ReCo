//
//  ContractCells.h
//  ReCo
//
//  Created by Alexander Hammond on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contract.h"
@interface ContractCells : UITableViewCell {
    IBOutlet UILabel *date;
}

@property Contract *contract;

-(void)updateCell;

@end

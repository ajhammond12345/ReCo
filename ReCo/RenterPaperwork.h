//
//  RenterPaperwork.h
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RenterPaperwork : UIViewController {
    
    IBOutlet UILabel *paperwork;
    IBOutlet UIButton *currentContract;
    IBOutlet UIButton *pastContracts;
    IBOutlet UIButton *back;
}

-(IBAction)currentContract:(id)sender;
-(IBAction)pastContracts:(id)sender;
-(IBAction)back:(id)sender;

@end

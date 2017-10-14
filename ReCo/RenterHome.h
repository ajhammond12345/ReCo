//
//  RenterHome.h
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RenterHome : UIViewController {
    
    IBOutlet UIImageView *home;
    IBOutlet UILabel *addressLabel;
    IBOutlet UILabel *UserAddress;
    IBOutlet UIButton *notifications;
    IBOutlet UIButton *payment;
    IBOutlet UIButton *issues;
    IBOutlet UIButton *paperwork;

}

-(IBAction)notifications:(id)sender;
-(IBAction)payment:(id)sender;
-(IBAction)issues:(id)sender;
-(IBAction)paperwork:(id)sender;



@end

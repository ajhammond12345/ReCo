//
//  PropertyView.h
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PropertyView : UIViewController{
    
    IBOutlet UILabel *addressLabel;
    IBOutlet UILabel *UserAddress;
    IBOutlet UILabel *balanceDue;
    IBOutlet UILabel *UserBalanceDue;
    IBOutlet UIButton *renterIssues;
    IBOutlet UIButton *contract;
    IBOutlet UIButton *messageRenter;
    IBOutlet UIButton *expenses;
    IBOutlet UIButton *back;
    
}

-(IBAction)renterIssues:(id)sender;
-(IBAction)contract:(id)sender;
-(IBAction)messageRenter:(id)sender;
-(IBAction)expenses:(id)sender;
-(IBAction)back:(id)sender;


@end

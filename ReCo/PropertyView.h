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
    IBOutlet UIButton *contracts;
    IBOutlet UIButton *messageRenter;
    IBOutlet UIButton *expenses;
    IBOutlet UIButton *back;



    
}
@end

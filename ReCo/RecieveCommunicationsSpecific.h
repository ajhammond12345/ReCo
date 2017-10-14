//
//  RecieveCommunicationsSpecific.h
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecieveCommunicationsSpecific : UIViewController {
    IBOutlet UILabel *title;
    IBOutlet UILabel *body;
    IBOutlet UIButton *resolve;
    IBOutlet UIButton *back;
}

-(IBAction)resolve:(id)sender;
-(IBAction)back:(id)sender;
@property bool isManager;



@end

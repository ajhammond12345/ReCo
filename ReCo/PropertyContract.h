//
//  PropertyContract.h
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PropertyContract : UIViewController {
    
    IBOutlet UIButton *back;
}

@property bool isManager;
-(IBAction)back:(id)sender;

@end

//
//  RenterNoProperty.h
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RenterNoProperty : UIViewController <UITextFieldDelegate>{
    IBOutlet UILabel *houseLabel;
    IBOutlet UITextField *houseField;
    IBOutlet UIButton *uploadContractButton;
    IBOutlet UILabel *uploadContractLabel;
    IBOutlet UIButton *continues;
    IBOutlet UIImageView *contractImage;

}

@property NSMutableArray *contractImages;

-(IBAction)continues:(id)sender;
-(IBAction)uploadContract:(id)sender;


@end



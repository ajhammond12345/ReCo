//
//  Utility.h
//  ReCo
//
//  Created by Alexander Hammond on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Utility : UIViewController {
    
}

@property NSDictionary *result;

+(void)throwAlertWithTitle:(NSString *)title message:(NSString *)message sender:(id)sender;

@end

//
//  Notification.m
//  ReCo
//
//  Created by Alexander Hammond on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "Notification.h"

@implementation Notification

-(void)setLocalDictionary {
    _localDictionary = [NSDictionary dictionaryWithObjectsAndKeys:_title, @"notification_title", _text, @"notification_text", nil];
}




@end

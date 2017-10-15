//
//  Notification.h
//  ReCo
//
//  Created by Alexander Hammond on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Notification : NSObject {
    
}

@property NSString *title;
@property NSString *text;
@property NSDictionary *localDictionary;

-(void)setLocalDictionary;


@end



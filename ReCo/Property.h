//
//  Property.h
//  ReCo
//
//  Created by Alexander Hammond on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Property : NSObject {
    
}

-(void)setPropertyDictionary;

@property UIImage *avatar;
@property NSString *address;
@property int rentInCents;
@property NSArray *beforePics;
@property NSDictionary *localDictionary;

+(Property *)loadPropertyFromDictionary:(NSDictionary *)dic;



@end

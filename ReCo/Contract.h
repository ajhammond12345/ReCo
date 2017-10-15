//
//  Contract.h
//  ReCo
//
//  Created by Alexander Hammond on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Contract : NSObject {
    
}

@property UIImage *file;
@property bool isSigned;
@property NSString *dateSigned;
@property NSString *dateExpired;
@property int propertyId;
@property NSDictionary *localDictionary;

-(void)setLocalDictionary;


@end

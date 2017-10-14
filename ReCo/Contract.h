//
//  Contract.h
//  ReCo
//
//  Created by Alexander Hammond on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <Foundation/Foundation.h>
UIImage *file;
@interface Contract : NSObject
@property bool isSigned;
@property int dateSigned;
@property int dateExpired;
@property int propertyId;
@end

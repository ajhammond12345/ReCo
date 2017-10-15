//
//  Property.m
//  ReCo
//
//  Created by Alexander Hammond on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "Property.h"

@implementation Property
    

-(void)setPropertyDictionary {
    NSData *imageData = UIImageJPEGRepresentation(_avatar, .6);
    NSArray *pics = _beforePics;
    for (int i = 0; i < pics.count; i++) {
        NSData *pic = UIImageJPEGRepresentation((UIImage *)[pics objectAtIndex:i], .6);
        
    }
    //NSLog(@"Purchase State: %@", purchaseState);
    if (imageData == nil)
        imageData = [[NSData alloc] init];
    
    //NSLog(@"These Can't Be NULL: %@, %@, %@", imageData, commentsCopy, likedData);
    _localDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                        _address, @"rental_address",
                        [NSString stringWithFormat:@"%zd", _rentInCents], @"rental_rent",
                        imageData, @"rental_image",
                        nil];
}


@end

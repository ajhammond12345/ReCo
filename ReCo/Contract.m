//
//  Contract.m
//  ReCo
//
//  Created by Alexander Hammond on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "Contract.h"

@implementation Contract

-(void)setLocalDictionary {
    _localDictionary = [NSDictionary dictionaryWithObjectsAndKeys:_dateSigned, @"contract_date_signed", _dateExpired, @"contract_date_expired",[NSNumber numberWithBool:true], @"contract_is_signed", [NSNumber numberWithInt:_propertyId], @"contract_property_id", nil];
}


@end

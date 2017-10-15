//
//  Expense.m
//  ReCo
//
//  Created by Alexander Hammond on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "Expense.h"

@implementation Expense

-(void)setLocalDictionary {
    _localDictionary = [NSDictionary dictionaryWithObjectsAndKeys:_reason, @"expense_reason", [NSNumber numberWithInt:_amount], @"expense_amount", nil];
}

@end

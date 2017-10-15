//
//  Expense.h
//  ReCo
//
//  Created by Alexander Hammond on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Expense : NSObject {
    
}

@property int amount;
@property NSString *reason;
@property NSDictionary *localDictionary;

-(void)setLocalDictionary;
-(void)loadExpenseFromDictionary:(NSDictionary *)dic;
@end

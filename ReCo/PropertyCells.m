//
//  PropertyCells.m
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "PropertyCells.h"

@implementation PropertyCells

-(void)updateCell {
    address.text = _property.address;
    rent.text = [NSString stringWithFormat:@"%i", _property.rentInCents];
    housePic.image = _property.avatar;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

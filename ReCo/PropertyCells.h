//
//  PropertyCells.h
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Property.h"
@interface PropertyCells : UITableViewCell {
    IBOutlet UILabel *address;
    IBOutlet UIImageView *housePic;
}
@porperty Property *property;
@end

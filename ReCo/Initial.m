//
//  Initial.m
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "Initial.h"

@interface Initial ()

@end

@implementation Initial

-(int)getUserType {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *userType = [defaults objectForKey:@"user_type"];
    return (int)userType;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.    
}

-(void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int userType = [self getUserType];
    if ([defaults objectForKey:@"user_id"] != nil) {
        switch (userType) {
            case 1: [self performSegueWithIdentifier:@"toManagerHome" sender:self];
            case 2: [self performSegueWithIdentifier:@"toRenterHome" sender:self];
            case 3: [self performSegueWithIdentifier:@"toRenterNoProperty" sender:self];
            case 4: [self performSegueWithIdentifier:@"toUserType" sender:self];
            default: [self performSegueWithIdentifier:@"toUserType" sender:self];
        }
    }
    else {
        [self performSegueWithIdentifier:@"toUserType" sender:self];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

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
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *firstLogin = [defaults objectForKey:@"first_login"];
    int userType = [self getUserType];
    if ([firstLogin isEqualToNumber: [NSNumber numberWithInt:2]]) {
        switch (userType) {
            case 0: [self performSegueWithIdentifier:@"toManagerHome" sender:self];
            case 1: [self performSegueWithIdentifier:@"toRenterHome" sender:self];
            case 2: [self performSegueWithIdentifier:@"toRenterNoProperty" sender:self];
        }
    }
    else {
        [defaults setObject:[NSNumber numberWithInt:2] forKey:@"first_login"];
        [self performSegueWithIdentifier:@"toRegistration" sender:self];
    }
    // Do any additional setup after loading the view.    
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

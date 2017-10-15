//
//  Utility.m
//  ReCo
//
//  Created by Alexander Hammond on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "Utility.h"

@interface Utility ()

@end

@implementation Utility


+(void)throwAlertWithTitle:(NSString *)title message:(NSString *)message sender:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
                                    {
                                        
                                    }];
    [alert addAction:defaultAction];
    [sender presentViewController:alert animated:YES completion:nil];
}

+(void)setUserType:(int)type {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *newType = [NSNumber numberWithInt:type];
    [defaults setObject:newType forKey:@"user_type"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
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

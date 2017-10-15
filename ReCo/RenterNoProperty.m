//
//  RenterNoProperty.m
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "RenterNoProperty.h"

@interface RenterNoProperty () <UITextFieldDelegate>

@end

@implementation RenterNoProperty


-(IBAction)continues:(id)sender {
    //check if it is valid, save locally the property
    [self performSegueWithIdentifier:@"toRenterHome" sender:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    houseField.delegate = self;
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

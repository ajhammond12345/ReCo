//
//  ViewController.m
//  ReCo
//
//  Created by Alexander Hammond on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController

-(IBAction)propertyManager:(id)sender {
    _isPM = true;
}

-(IBAction)tenant:(id)sender {
    _isPM = false;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    password.delegate = self;
    username.delegate = self;
    legalName.delegate = self;
    EmailAddress.delegate = self;
    phoneNumber.delegate = self;
    // Dispose of any resources that can be recreated.
}


@end

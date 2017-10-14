//
//  SendCommunication.m
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "SendCommunication.h"

@interface SendCommunication () <UITextFieldDelegate>

@end

@implementation SendCommunication

-(IBAction)back:(id)sender{
    if (_isManager){
        [self performSegueWithIdentifier:@"toPropertyView" sender:self];
    } else {
        [self performSegueWithIdentifier:@"toRenterHome" sender:self];
    }
}
-(IBAction)send:(id)sender{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    title.delegate = self;
    body.delegate = self;
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

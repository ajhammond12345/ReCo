//
//  RecieveCommunicationsSpecific.m
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "RecieveCommunicationsSpecific.h"
#import "RecieveCommunicationsList.h"

@interface RecieveCommunicationsSpecific ()

@end

@implementation RecieveCommunicationsSpecific


-(IBAction)back:(id)sender {
    [self performSegueWithIdentifier:@"toReceiveCommunicationsList" sender:self];
}
/*Need to pass parameter with this too!*/
-(IBAction)resolve:(id)sender {
    [self performSegueWithIdentifier:@"toReceiveCommunicationsList" sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"toRecieveCommunicationsList"]) {
        
        RecieveCommunicationsList *destViewController = segue.destinationViewController;
        destViewController.isManager = _isManager;
    }
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

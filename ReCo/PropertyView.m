//
//  PropertyView.m
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "PropertyView.h"
#import "RecieveCommunicationsList.h"


@interface PropertyView ()

@end

@implementation PropertyView


-(IBAction)renterIssues:(id)sender{
    [self performSegueWithIdentifier:@"toReceiveCommunicationsList" sender:self];
}
-(IBAction)contract:(id)sender{
    [self performSegueWithIdentifier:@"toPropertyContract" sender:self];
}
-(IBAction)messageRenter:(id)sender{
    [self performSegueWithIdentifier:@"toSendCommunication" sender:self];
}
-(IBAction)expenses:(id)sender{
    [self performSegueWithIdentifier:@"SpecificPropertyExpenses" sender:self];
}
-(IBAction)back:(id)sender{
    [self performSegueWithIdentifier:@"toManagerHome" sender:self];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toReceiveCommunicationsList"]) {
        ReceiveCommunicationsList *destViewController = segue.destinationViewController;
        destViewController.isManager = true;
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

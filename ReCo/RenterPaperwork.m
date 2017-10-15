//
//  RenterPaperwork.m
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "RenterPaperwork.h"
#import "PropertyContract.h"
#import "PastContracts.h"


@interface RenterPaperwork ()

@end

@implementation RenterPaperwork

-(IBAction)currentContract:(id)sender{
    [self performSegueWithIdentifier:@"toPropertyContract" sender:self];
}
-(IBAction)pastContracts:(id)sender{
    [self performSegueWithIdentifier:@"toPastContracts" sender:self];
}
-(IBAction)back:(id)sender{
    [self performSegueWithIdentifier:@"toRenterHome" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toPropertyContract"]) {
        PropertyContract *destViewController = segue.destinationViewController;
        destViewController.isManager = false;
    }
    if ([segue.identifier isEqualToString:@"toPastContracts"]) {
        PastContracts *destViewController = segue.destinationViewController;
        destViewController.isManager = false;
    }
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [currentContract.titleLabel setTextAlignment: NSTextAlignmentCenter];
    [pastContracts.titleLabel setTextAlignment: NSTextAlignmentCenter];

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

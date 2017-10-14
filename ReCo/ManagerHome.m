//
//  ManagerHome.m
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "ManagerHome.h"
#import "PastContracts.h"

@interface ManagerHome () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation ManagerHome

-(IBAction)addProperty:(id)sender{
    [self performSegueWithIdentifier:@"toCreateProperty" sender:self];

}
-(void)toPropertyView {
    [self performSegueWithIdentifier:@"toPropertyView" sender:self];

}
-(IBAction)expenses:(id)sender{
    [self performSegueWithIdentifier:@"toManagerExpenses" sender:self];
}
-(IBAction)contracts:(id)sender{
    [self performSegueWithIdentifier:@"toPastContracts" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toCreateProperty"]) {
        PastContracts *destViewController = segue.destinationViewController;
        destViewController.isManager = true;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    propertyTable.delegate = self;
    propertyTable.dataSource = self;
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

//
//  RenterHome.m
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "RenterHome.h"

@interface RenterHome ()

@end

@implementation RenterHome


-(IBAction)notifications:(id)sender{
    [self performSegueWithIdentifier:@"toReceiveCommunicationsSpecific" sender:self];
}
-(IBAction)payment:(id)sender{
    [self performSegueWithIdentifier:@"toRenterPayment" sender:self];
}
-(IBAction)issues:(id)sender{
    [self performSegueWithIdentifier:@"toSendCommunication" sender:self];
}
-(IBAction)paperwork:(id)sender{
    [self performSegueWithIdentifier:@"toRenterPaperwork" sender:self];
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

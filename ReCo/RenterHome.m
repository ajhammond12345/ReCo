//
//  RenterHome.m
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "RenterHome.h"
#import "RecieveCommunicationsList.h"
#import "SendCommunication.h"


@interface RenterHome ()

@end

@implementation RenterHome

-(IBAction)notifications:(id)sender{
    [self performSegueWithIdentifier:@"toRecieveCommunicationsList" sender:self];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toRecieveCommunicationsList"]) {
        RecieveCommunicationsList *destViewController = segue.destinationViewController;
        destViewController.isManager = false;
    }
    if ([segue.identifier isEqualToString:@"toSendCommunication"]) {
        SendCommunication *destViewController = segue.destinationViewController;
        destViewController.isManager = false;
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

//
//  CreateProperty.m
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "CreateProperty.h"

@interface CreateProperty ()

@end

@implementation CreateProperty


-(IBAction)back:(id)sender{
    [self performSegueWithIdentifier:@"toManagerHome" sender:self];

}
-(IBAction)addProperty:(id)sender{
    [self performSegueWithIdentifier:@"toManagerHome" sender:self];

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

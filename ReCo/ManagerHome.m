//
//  ManagerHome.m
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//
#import "PropertyCells.h"
#import "ManagerHome.h"
#import "PastContracts.h"
#import "Picture.h"

@interface ManagerHome () <UITableViewDataSource,UITableViewDelegate, NSURLSessionDelegate>

@end

@implementation ManagerHome

-(IBAction)logout:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSString stringWithFormat:@"%i", 3] forKey:@"user_type"];
    [self performSegueWithIdentifier:@"logout" sender:self];
}

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


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PropertyCells *tmpCell = [propertyTable cellForRowAtIndexPath:indexPath];
        _propertyToSend = tmpCell.property;
        [self performSegueWithIdentifier:@"toPropertyView" sender:indexPath];
    }

//delegate method used to load table view
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PropertyCells *cell = (PropertyCells *)[tableView dequeueReusableCellWithIdentifier:@"propertyCell" forIndexPath:indexPath];
    cell.property = [_propertyList objectAtIndex:indexPath.row];
    //updates the views in the cell
    [cell updateCell];

    return cell;
}

//provides the number of rows that will be in table view (just a count of the array)
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _propertyList.count;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toPastContracts"]) {
        PastContracts *destViewController = segue.destinationViewController;
        destViewController.isManager = true;
    }
    
}










//loads all of the items
-(void)loadAllProperties {
    
    //-- Make URL request with server to load all of the items
    if (_propertyList != nil) {
        [propertyTable reloadData];
    }
    //production url
    NSURL *url = [NSURL URLWithString:@"https://quiet-crag-59586.herokuapp.com/rentals.json"];
    //testing url
    //NSURL *url = [NSURL URLWithString:@"https://localhost:3001/rentals.json"];
  
    NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url];
    [dataTask resume];
    
}


//loads all of the items when the data task is complete
- (void)URLSession:(NSURLSession *)session
          dataTask:(NSURLSessionDataTask *)dataTask
    didReceiveData:(NSData *)data {
    
    NSError *error;
    _result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    //NSLog(@"Result (Length: %zd) = %@",_result.count, _result);
    //this interprets the data received a creates a bunch of items from it
    NSMutableArray *tmpPropertyArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < _result.count; i++) {
        NSDictionary *tmpDic = [_result objectAtIndex:i];
        //NSLog(@"Dictionary %@", tmpDic);
        Property *loadProperty = [self loadPropertyFromDictionary:tmpDic];
        //[self loadItemImage:loadItem];
        [tmpPropertyArray addObject:loadProperty];
    }
    
    //if data receieved it saves the interpreted data to the local array
    if (tmpPropertyArray != nil) {
        _propertyList = tmpPropertyArray;
    }
    
    else {
        //if no data received it provides this alert
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"No Connection\n" message:@"Could not load items" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    [propertyTable reloadData];
    [session invalidateAndCancel];
    
}


-(Property *)loadPropertyFromDictionary:(NSDictionary *)dic {
    Property *myProp = [[Property alloc] init];
    myProp.avatar = [dic objectForKey:@"rental_image"];
    myProp.address = [dic objectForKey:@"rental_address"];
    myProp.rentInCents = [[dic objectForKey:@"rental_rent"] intValue];
    NSArray *picData = [dic objectForKey:@"pictures"];
    NSMutableArray *pictures = [[NSMutableArray alloc] init];
    for (int i = 0; i < picData.count; i++) {
        Picture *newPic = [[Picture alloc] init];
        NSDictionary *picInfo = [picData objectAtIndex:i];
        newPic.picData = [picInfo objectForKey:@"picture_image"];
        newPic.isBefore = [[picInfo objectForKey:@"picture_is_before"] boolValue];
        if (newPic.isBefore) {
            [pictures addObject:newPic];
        }
    }
    myProp.beforePics = [pictures copy];
    return myProp;
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

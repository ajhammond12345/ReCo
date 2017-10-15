//
//  PastContracts.m
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "PastContracts.h"
#import "ContractCells.h"

@interface PastContracts () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation PastContracts

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContractCells *cell = (ContractCells *)[tableView dequeueReusableCellWithIdentifier:@"PastContractCell" forIndexPath:indexPath];
    cell.contract = [_contractList objectAtIndex:indexPath.row];
    //updates the views in the cell
    [cell updateCell];
    return cell;
}

//provides the number of rows that will be in table view (just a count of the array)
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _contractList.count;
}

-(IBAction)back:(id)sender;{
    if (_isManager) {
        [self performSegueWithIdentifier:@"toManagerHome" sender:self];
    } else {
        [self performSegueWithIdentifier:@"toRenterPaperwork" sender:self];
    }
    
}

//loads all of the items
-(void)loadAllContracts {
    
    //-- Make URL request with server to load all of the items
    if (_contractList != nil) {
        [contractTable reloadData];
    }
    NSString *jsonUrlString = [NSString stringWithFormat:@"https://localhost:3001/Contracts.json"];
    NSURL *url = [NSURL URLWithString:jsonUrlString];
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
    NSMutableArray *tmpContractArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < _result.count; i++) {
        NSDictionary *tmpDic = [_result objectAtIndex:i];
        //NSLog(@"Dictionary %@", tmpDic);
        Contract *loadContract = [self loadContractFromDictionary:tmpDic];
        //[self loadItemImage:loadItem];
        [tmpContractArray addObject:loadContract];
    }
    
    
    //if data receieved it saves the interpreted data to the local array
    if (tmpContractArray != nil) {
        _contractList = tmpContractArray;
    }
    
    else {
        //if no data received it provides this alert
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"No Connection\n" message:@"Could not load items" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    [contractTable reloadData];
    [session invalidateAndCancel];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    contractTable.delegate = self;
    contractTable.dataSource = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

-(Contract *)loadContractFromDictionary:(NSDictionary *)dic{
    Contract *myContract = [[Contract alloc] init];
    myContract.dateSigned = [dic objectForKey:(@"contract_date_signed")];
    myContract.dateExpired = [dic objectForKey:(@"contract_date_expired")];
    myContract.isSigned = [[dic objectForKey:@"contract_is_signed"] boolValue];
    myContract.propertyId = [[dic objectForKey:(@"contract_property_id")] intValue];
    return myContract;
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

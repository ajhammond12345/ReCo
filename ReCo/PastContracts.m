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

-(void)uploadComment:(NSString *)comment {
    [_comments addObject:comment];
    NSError *error;
    
    //creates mutable copy of the dictionary to remove extra keys
    NSMutableDictionary *tmpDic = [NSMutableDictionary dictionaryWithObject:comment forKey:@"comment_text"];
    [tmpDic setObject:[NSString stringWithFormat:@"%zd", _itemID]forKey:@"item_id"];
    
    //converts the dictionary to json
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:tmpDic options:NSJSONWritingPrettyPrinted error:&error];
    //logs the data to check if it is created successfully
    //NSLog(@"%@", [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    
    //creates url for the request
    NSURL *url = [NSURL URLWithString:@"https://murmuring-everglades-79720.herokuapp.com/comments.json"];
    
    //creates a URL request
    NSMutableURLRequest *uploadRequest = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    //specifics for the request (it is a post request with json content)
    [uploadRequest setHTTPMethod:@"POST"];
    [uploadRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [uploadRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [uploadRequest setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[jsonData length]] forHTTPHeaderField:@"Content-Length"];
    [uploadRequest setHTTPBody: jsonData];
    
    //
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    [[session dataTaskWithRequest:uploadRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *requestReply = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
            NSLog(@"requestReply: %@", requestReply);
        });
    }] resume];
    //add the comment to the server
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

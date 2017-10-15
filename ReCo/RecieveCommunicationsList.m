//
//  RecieveCommunicationsList.m
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "RecieveCommunicationsList.h"
#import "RecieveCommunicationsSpecific.h"


@interface RecieveCommunicationsList ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation RecieveCommunicationsList


-(IBAction)back:(id)sender{
    if(_isManager){
        [self performSegueWithIdentifier:@"toPropertyView" sender:self];
    } else {
        [self performSegueWithIdentifier:@"toRenterHome" sender:self];
    }
}

/* Still need to send a parameter with this */
-(void)toReceiveCommunicationsSpecific {
    [self performSegueWithIdentifier:@"toRecieveCommunicationsSpecific" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"toRecieveCommunicationsSpecific"]) {
        
        RecieveCommunicationsSpecific *destViewController = segue.destinationViewController;
        destViewController.isManager = _isManager;
    }
}

//loads all of the items
-(void)loadAllItems {
    
    //-- Make URL request with server to load all of the items
    if (_items != nil) {
        [itemsView reloadData];
    }
    NSString *jsonUrlString = [NSString stringWithFormat:@"https://murmuring-everglades-79720.herokuapp.com/items.json"];
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
    NSMutableArray *tmpItemArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < _result.count; i++) {
        NSDictionary *tmpDic = [_result objectAtIndex:i];
        //NSLog(@"Dictionary %@", tmpDic);
        Item *loadItem = [self itemFromDictionaryExternal:tmpDic];
        //[self loadItemImage:loadItem];
        [tmpItemArray addObject:loadItem];
    }
    /*for (int i = 0; i <tmpItemArray.count; i++) {
     
     }*/
    
    //updates the liked items list to load which of the new items the user has liked
    [self loadLikedItems];
    
    //sets the 'liked' value of the loaded items
    for (int i = 0; i < tmpItemArray.count; i++) {
        for (int j = 0; j < _likedItems.count; j++) {
            if ([[tmpItemArray objectAtIndex:i] getItemID] == [[_likedItems objectAtIndex:j] getItemID]) {
                [[tmpItemArray objectAtIndex:i] setLiked:true];
            }
        }
    }
    //if data receieved it saves the interpreted data to the local array
    if (tmpItemArray != nil) {
        _items = tmpItemArray;
    }
    
    else {
        //if no data received it provides this alert
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"No Connection\n" message:@"Could not load items" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    [itemsView reloadData];
    [session invalidateAndCancel];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    notificationTable.delegate = self;
    notificationTable.dataSource = self;
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

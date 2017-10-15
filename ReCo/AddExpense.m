//
//  AddExpense.m
//  ReCo
//
//  Created by Abhinav Tirath on 10/14/17.
//  Copyright © 2017 ARA. All rights reserved.
//

#import "AddExpense.h"
#import "Expense.h"

@interface AddExpense ()

@end

@implementation AddExpense

-(IBAction)back:(id)sender{
    [self performSegueWithIdentifier:@"toManagerExpenses" sender:self];
}
-(IBAction)submit:(id)sender{
    [self performSegueWithIdentifier:@"toManagerExpenses" sender:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    amountInput.delegate = self;
    reasonInput.delegate = self;
}

//for the text fields that are directly edited (name? and amount?)
-(void)textFieldDidEndEditing:(UITextField *)textField {
    //if user was editting price it updates the price field and formats the input to be displayed in the text field
    if ([textField isEqual: amountInput]) {
        NSString *cents;
        NSString *dollars;
        int priceCents;
        int priceDollars;
        //formatting input
        for (int i = 0; i < amountInput.text.length; i++) {
            if ([[[amountInput.text substringFromIndex:i] substringToIndex:1] isEqualToString:@"."]) {
                cents = [amountInput.text substringFromIndex:i];
                dollars = [amountInput.text substringToIndex:i];
                break;
            }
        }
        if (dollars == nil) {
            dollars = amountInput.text;
            if ([dollars isEqualToString:@""]) {
                dollars = @"0";
            }
        }
        if (cents == nil) {
            cents = @".00";
        }
        NSCharacterSet *mySet = [NSCharacterSet characterSetWithCharactersInString:@"."];
        cents = [cents stringByTrimmingCharactersInSet:mySet];
        if (cents.length == 1) {
            [cents stringByAppendingString:@"0"];
        }
        priceCents = (int)[cents integerValue];
        dollars = [dollars stringByTrimmingCharactersInSet:mySet];
        priceDollars = (int)[dollars integerValue];
        NSLog(@"Price: %@%i", dollars, priceDollars);
        //saving input
        _amount = (priceDollars * 100) + priceCents;
        NSLog(@"%zd", _amount);
        //outputting formatted input
        amountInput.text = [NSString stringWithFormat:@"$%@.%@", dollars, cents];
        if ([amountInput.text isEqualToString:@"$0.00"]) {
            amountInput.text = @"";
            _amount = 0;
            amountInput.placeholder = @"$0.00";
        }
    }
    //closes keyboard
    [textField resignFirstResponder];
    [self.view endEditing:YES];
}

-(IBAction)createExpense:(id)sender {
    [self.view endEditing:YES];
    _reason = reasonInput.text;
    //first need to check that all fields have data
    if ([_reason isEqualToString:@""]
        || _amount == 0) {
        NSString *errorMessage;
        if ([_reason isEqualToString:@""]) {
            errorMessage = @"Please put in a reason for the expense";
        }
        else if (_amount == 0) {
            errorMessage = @"Please input an amount for this house";
        }
        else {
            errorMessage = @"Sorry we are unable to save a new Expense for you at this time. Please try again later.";
        }
        //shows error message for missing information
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Missing Information" message:errorMessage preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        //closes keyboards
        [self.view endEditing:YES];
        //creates the Item object
        Expense *newExpense = [[Expense alloc] init];
        newExpense.amount = _amount;
        newExpense.reason = _reason;
        [newProperty setLocalDictionary];
        //creates error handler
        NSError *error;
        
        //creates mutable copy of the dictionary to remove extra keys
        NSMutableDictionary *tmpDic = [newExpense.localDictionary mutableCopy];
        
        //JSON Upload - does not upload the image
        //converts the dictionary to json
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:tmpDic options:NSJSONWritingPrettyPrinted error:&error];
        //logs the data to check if it is created successfully
        NSLog(@"%@", [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
        
        //production url
        NSURL *url = [NSURL URLWithString:@"https://localhost:3001/Expenses.json"];
        
        //creates a URL request
        NSMutableURLRequest *uploadRequest = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
        //specifics for the request (it is a post request with json content)
        [uploadRequest setHTTPMethod:@"POST"];
        [uploadRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [uploadRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [uploadRequest setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[jsonData length]]forHTTPHeaderField:@"Content-Length"];
        [uploadRequest setHTTPBody: jsonData];
        
        //create some type of waiting image here
        NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        
        //runs the data task
        [[session dataTaskWithRequest:uploadRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSString *requestReply = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
                NSLog(@"requestReply: %@", [[requestReply class] description]);
                //if the result has the class type __NSCFConstantString then the item failed to upload
                if ([[[requestReply class] description] isEqualToString:@"__NSCFConstantString"]) {
                    //alert for failing to upload
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"No Connection\n" message:@"Could not donate the item. Please check your internet connection and try again." preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
                    [alert addAction:defaultAction];
                    [self presentViewController:alert animated:YES completion:nil];
                }
                else {
                    [self performSegueWithIdentifier:@"toManagerHome" sender:self];
                }
            });
        }] resume];
    }
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

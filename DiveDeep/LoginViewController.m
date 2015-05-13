//
//  LoginViewController.m
//  DiveDeep
//
//  Created by ReddyBasha on 3/1/15.
//  Copyright (c) 2015 tech. All rights reserved.
//

#import "LoginViewController.h"
#import "SWRevealViewController.h"
#import "RecordsList.h"
#import "RecordsModel.h"

@interface LoginViewController ()<NSURLConnectionDelegate> {
    NSURLConnection *profileConnection;
    NSMutableData *profileData;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.menuBarItem setTarget: self.revealViewController];
        [self.menuBarItem setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.userName) {
        [self.password becomeFirstResponder];
    }
    else if (textField == self.password) {
        [self.password resignFirstResponder];
    }
    return  YES;
}

- (IBAction)loginClicked:(id)sender {
    if ([self.userName.text isEqualToString:@"crazynerds"] && [self.password.text isEqualToString:@"crazynerds"]) {
        [self fetchUserProfile];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isLoggedIn"];
    }
    else
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isLoggedIn"];
    
}

- (void)fetchUserProfile {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.myjson.com/bins/x343"]];
    profileConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    profileData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [profileData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    
    NSError *e = nil;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData: profileData options: NSJSONReadingMutableContainers error: &e];
    
    for (int i=0; i<jsonArray.count; i++) {
        RecordsModel *recordsModel = [[RecordsModel alloc] init];
        recordsModel.courseName = [[jsonArray objectAtIndex:i]valueForKey:@"coursename"];
        recordsModel.result = [[jsonArray objectAtIndex:i] valueForKey:@"marks"];
        [[[RecordsList recordsList] allRecords] addObject:recordsModel];
    }
    
    
    [self performSegueWithIdentifier:@"profileSegue" sender:self];
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
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

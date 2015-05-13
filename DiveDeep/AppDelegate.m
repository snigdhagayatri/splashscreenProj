//
//  AppDelegate.m
//  DiveDeep
//
//  Created by ReddyBasha on 2/28/15.
//  Copyright (c) 2015 tech. All rights reserved.
//

#import "AppDelegate.h"
#import "FeedbackModel.h"
#import "FeedbackList.h"

@interface AppDelegate ()<NSURLConnectionDelegate>

@property(nonatomic,strong) NSURLConnection *feedBackConnection;
@property(nonatomic,strong) NSMutableData *feedBackData;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self parseWebServiceData];
    return YES;
}

-(void)parseWebServiceData
{
    NSURL *aUrl = [NSURL URLWithString:@"http://api.myjson.com/bins/2lbbn"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:aUrl];
    
   self.feedBackConnection = [[NSURLConnection alloc] initWithRequest:request
                                                                 delegate:self];

}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    self.feedBackData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [self.feedBackData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    

    NSError *e = nil;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData: self.feedBackData options: NSJSONReadingMutableContainers error: &e];
    
    for (int i=0; i<jsonArray.count; i++) {
        FeedbackModel *feedbackModel = [[FeedbackModel alloc] init];
        feedbackModel.courseName = [[jsonArray objectAtIndex:i]valueForKey:@"coursename"];
        feedbackModel.feedback = [[jsonArray objectAtIndex:i] valueForKey:@"feedback"];
        feedbackModel.price = [[jsonArray objectAtIndex:i] valueForKey:@"price"];
        feedbackModel.imageName = [[jsonArray objectAtIndex:i] valueForKey:@"img"];
        [[[FeedbackList feedbackList] allFeedback] addObject:feedbackModel];
    }
    
    NSLog(@"courseName %@",jsonArray);
    


}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

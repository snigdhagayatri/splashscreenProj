//
//  ProfileViewController.h
//  DiveDeep
//
//  Created by ReddyBasha on 3/1/15.
//  Copyright (c) 2015 tech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBBarChartView.h"

@interface ProfileViewController : UIViewController 
@property (nonatomic, strong) IBOutlet UIBarButtonItem *logout;
-(IBAction)logoutClicked:(id)sender;
@end

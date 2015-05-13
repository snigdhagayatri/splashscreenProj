//
//  LoginViewController.h
//  DiveDeep
//
//  Created by ReddyBasha on 3/1/15.
//  Copyright (c) 2015 tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *userName;
@property (nonatomic, strong) IBOutlet UITextField *password;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *menuBarItem;
- (IBAction)loginClicked:(id)sender;

@end

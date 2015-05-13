//
//  ViewController.h
//  DiveDeep
//
//  Created by ReddyBasha on 2/28/15.
//  Copyright (c) 2015 tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    NSTimer *timer;
}
@property(nonatomic, strong) IBOutlet UIBarButtonItem *menuBarItem;
@property(nonatomic, strong) IBOutlet UITableView *tableView;
@property(nonatomic, strong) IBOutlet UIView *imageGalleryView;
@property(nonatomic, strong) IBOutlet UIImageView *scrollingImageView;
@property(nonatomic, strong) IBOutlet UIPageControl *pageControl;

- (IBAction)seeAllCourses:(id)sender;

- (IBAction)changeImage:(id)sender;
@end


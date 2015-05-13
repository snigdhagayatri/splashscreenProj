//
//  AllCoursesTableViewCell.h
//  DiveDeep
//
//  Created by ReddyBasha on 3/1/15.
//  Copyright (c) 2015 tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllCoursesTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *courseNameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *courseImage;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UIImageView *starImageView;
@end

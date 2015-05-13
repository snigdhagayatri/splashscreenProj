//
//  ViewController.m
//  DiveDeep
//
//  Created by ReddyBasha on 2/28/15.
//  Copyright (c) 2015 tech. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"
#import "FeaturedTableViewCell.h"


@interface ViewController () 

@property(nonatomic,strong) NSArray *courseArray;
@property(nonatomic,strong) NSArray *courseImage1Array;
@property(nonatomic,strong) NSArray *courseImage2Array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.menuBarItem setTarget: self.revealViewController];
        [self.menuBarItem setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(pageShouldChange:) userInfo:nil repeats:YES];
    self.scrollingImageView.image = [UIImage imageNamed:@"trending1.jpg"];
    
    self.courseArray = [[NSArray alloc]initWithObjects:@"New Courses",@"Mobile Programming",@"Web Programming",@"Certified Courses", nil];
    self.courseImage1Array = [[NSArray alloc]initWithObjects:@"mobile1.jpg",@"mobileProgramming2.jpg",@"webImage1.jpg",@"certifiedImage1.jpeg", nil];
    self.courseImage2Array = [[NSArray alloc]initWithObjects:@"python.png",@"mobileProgramming1.png",@"webImage2.jpg",@"certifiedImage2.jpeg", nil];
    
   
}

- (void)viewWillDisappear:(BOOL)animated {
    [timer invalidate];
    timer = nil;
    
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:animated];

}

- (void)pageShouldChange: (NSTimer *)timer {
    NSLog(@"Timer fired");
    [self.pageControl sendActionsForControlEvents:UIControlEventValueChanged];
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"FeaturedCell";
    FeaturedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if(cell == nil)
    {
        cell = [[FeaturedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.courseLabel.text = [self.courseArray objectAtIndex:indexPath.row];
    cell.imageView1.image = [UIImage imageNamed:[self.courseImage1Array objectAtIndex:indexPath.row]];
    cell.imageView2.image = [UIImage imageNamed:[self.courseImage2Array objectAtIndex:indexPath.row]];

    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return @"See All";
//}

/*
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView =[[UIView alloc]initWithFrame:CGRectMake(250, 0, 150, 50)];
    headerView.backgroundColor = [UIColor clearColor];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(250, 0, 150, 20)];
    label.text = @"See All";
    [headerView addSubview:label];
    
    return headerView;
}

*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)changeImage:(id)sender {
    NSLog(@"Image name is : %@", [self.scrollingImageView.image description]);
    UIImage *toImage;
    if ([self.scrollingImageView.image isEqual:[UIImage imageNamed:@"trending1.jpg"]]) {
        toImage = [UIImage imageNamed:@"trending2.jpg"];
        [self.pageControl setCurrentPage:1];
    }
    else if ([self.scrollingImageView.image isEqual:[UIImage imageNamed:@"trending2.jpg"]]) {
        toImage = [UIImage imageNamed:@"trending3.gif"];
        [self.pageControl setCurrentPage:2];
    }
    else {
        toImage = [UIImage imageNamed:@"trending1.jpg"];
        [self.pageControl setCurrentPage:0];
    }
    
    
    
    [UIView transitionWithView:self.scrollingImageView
                      duration:1.0f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        self.scrollingImageView.image = toImage;
                    } completion:nil];
}
@end

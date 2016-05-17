//
//  ViewController.m
//  scrollViewImageGalleries
//
//  Created by Krzysztof Kopytek on 2016-05-16.
//  Copyright © 2016 Krzysztof Kopytek. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController () <UIScrollViewDelegate>

@property (strong, nonatomic)  UIScrollView *scrollView;
@property (strong, nonatomic)  UIView *myImageContainer;
@property (weak, nonatomic) IBOutlet UIPageControl *pageController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // setup programmatically ... storybord su#$ :P
    [self setupMyScroll];
    
    
    
    UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapGesture:)];
    [self.myImageContainer addGestureRecognizer:singleTapGestureRecognizer];
    

}


// ====================================================================================================
-(void) setupMyScroll{
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectInset(self.view.frame, 20, 20)];
    
    //3 times wide because 3 images
    self.myImageContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 3*CGRectGetWidth(self.scrollView .frame),  CGRectGetHeight(self.scrollView .frame))];
    
    // adding 3 images 320 x 480 ... setting frames manualy (only 3 images :P) ... learning curve
    UIImageView *firstImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"puppy1.jpg"]];
    firstImage.frame = CGRectMake(0, 0, CGRectGetWidth(self.scrollView .frame), CGRectGetHeight(self.scrollView .frame));
    firstImage.contentMode = UIViewContentModeScaleAspectFit;
    
    UIImageView *secondImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"puppy2.jpg"]];
    secondImage.frame = CGRectMake(CGRectGetWidth(self.scrollView .frame), 0, CGRectGetWidth(self.scrollView .frame), CGRectGetHeight(self.scrollView .frame));
    secondImage.contentMode = UIViewContentModeScaleAspectFit;
    
    UIImageView *thirdImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"puppy3.jpg"]];
    thirdImage.frame = CGRectMake(2*CGRectGetWidth(self.scrollView .frame), 0, CGRectGetWidth(self.scrollView .frame), CGRectGetHeight(self.scrollView .frame));
    thirdImage.contentMode = UIViewContentModeScaleAspectFit;
    
    //adding 3 ImageViews to one containter
    [self.myImageContainer addSubview:firstImage];
    [self.myImageContainer addSubview:secondImage];
    [self.myImageContainer addSubview:thirdImage];
    
    //adding container to scroll
    [self.scrollView  addSubview:self.myImageContainer];
    
    //seting scroll params
    self.scrollView .contentSize = CGSizeMake(CGRectGetWidth(self.myImageContainer.frame), CGRectGetHeight(self.scrollView .frame));
    self.scrollView .pagingEnabled = YES;
    self.scrollView .delegate = self;
    [self.view addSubview:self.scrollView ];
    [self.view bringSubviewToFront: self.pageController];
    
    
}

// ====================================================================================================
-(void)handleSingleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer{

    [self performSegueWithIdentifier:@"detale" sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender {
    
    ViewController2 *controller = (ViewController2*)segue.destinationViewController;
    
    int page = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    
    if(page == 0) controller.imageName = @"puppy1.jpg";
    if(page == 1) controller.imageName = @"puppy2.jpg";
    if(page == 2) controller.imageName = @"puppy3.jpg";
    
}


// ====================================================================================================
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    self.pageController.currentPage = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
}


// ====================================================================================================
- (IBAction)changePage:(UIPageControl *)sender {
    
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width * sender.currentPage, 0)];
}


@end

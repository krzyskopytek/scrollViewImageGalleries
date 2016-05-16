//
//  ViewController.m
//  scrollViewImageGalleries
//
//  Created by Krzysztof Kopytek on 2016-05-16.
//  Copyright © 2016 Krzysztof Kopytek. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // setup programmatically ... storybord su#$ :P
    [self setupMyScroll];
    

}


// ====================================================================================================
-(void) setupMyScroll{
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectInset(self.view.frame, 20, 20)];
    
    //3 times wide because 3 images
    UIView *myImageContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 3*CGRectGetWidth(scrollView.frame),  CGRectGetHeight(scrollView.frame))];
    
    // adding 3 images 320 x 480 ... setting frames manualy (only 3 images :P) ... learning curve
    UIImageView *firstImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"puppy1.jpg"]];
    firstImage.frame = CGRectMake(0, 0, CGRectGetWidth(scrollView.frame), CGRectGetHeight(scrollView.frame));
    firstImage.contentMode = UIViewContentModeScaleAspectFit;
    
    UIImageView *secondImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"puppy2.jpg"]];
    secondImage.frame = CGRectMake(CGRectGetWidth(scrollView.frame), 0, CGRectGetWidth(scrollView.frame), CGRectGetHeight(scrollView.frame));
    secondImage.contentMode = UIViewContentModeScaleAspectFit;
    
    UIImageView *thirdImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"puppy3.jpg"]];
    thirdImage.frame = CGRectMake(2*CGRectGetWidth(scrollView.frame), 0, CGRectGetWidth(scrollView.frame), CGRectGetHeight(scrollView.frame));
    thirdImage.contentMode = UIViewContentModeScaleAspectFit;
    
    //adding 3 ImageViews to one containter
    [myImageContainer addSubview:firstImage];
    [myImageContainer addSubview:secondImage];
    [myImageContainer addSubview:thirdImage];
    
    //adding container to scroll
    [scrollView addSubview:myImageContainer];
    
    //seting scroll params
    scrollView.contentSize = CGSizeMake(CGRectGetWidth(myImageContainer.frame), CGRectGetHeight(scrollView.frame));
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    
}


@end

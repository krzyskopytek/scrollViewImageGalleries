//
//  ViewController2.m
//  scrollViewImageGalleries
//
//  Created by Krzysztof Kopytek on 2016-05-16.
//  Copyright © 2016 Krzysztof Kopytek. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 () <UIScrollViewDelegate>

@property (strong, nonatomic)  UIScrollView *scrollView;
@property (strong, nonatomic)  UIView *myImageContainer;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // setup programmatically ... storybord su#$ :P
    [self setupMyScroll];
    
    
}


// ====================================================================================================
-(void) setupMyScroll{
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectInset(self.view.frame, 20, 20)];
    
    self.myImageContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.scrollView.frame),  CGRectGetHeight(self.scrollView.frame))];
    
    UIImageView *justOneImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"puppy1.jpg"]];
    justOneImage.frame = CGRectMake(0, 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame));
    justOneImage.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.myImageContainer addSubview:justOneImage];

    //adding container to scroll
    [self.scrollView addSubview:self.myImageContainer];
    
    //seting scroll params
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.myImageContainer.frame), CGRectGetHeight(self.scrollView.frame));
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
    self.scrollView.minimumZoomScale = 0.5;
    self.scrollView.maximumZoomScale = 2;
    
    
}

// ====================================================================================================
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    if(scrollView == self.scrollView)
        return self.myImageContainer;
    else
        return nil;
    
}


@end

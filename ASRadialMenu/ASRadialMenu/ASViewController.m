//
//  ASViewController.m
//  ASRadialMenu
//
//  Created by Antonio_Stilo on 7/3/14.
//  Copyright (c) 2014 Antonio_Stilo. All rights reserved.
//

#import "ASViewController.h"
#import <pop/POP.h>


@interface ASViewController ()
{
    CGRect originalFrame;
}
@end

@implementation ASViewController
@synthesize circularBtn;

-(void)closeRadialMenu:(ASRadialSelectionView*)item
{
    if (item) {
        /*[UIView animateWithDuration:0.6 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^{
            circularBtn.frame = originalFrame;

        } completion:^(BOOL finished) {
            circularBtn.layer.cornerRadius = 50.0;
            circularBtn.backgroundColor = item.randomColor;
            [circularBtn setTitle:item.nameLabel.text forState:UIControlStateNormal];

        }];
         */
        
        [circularBtn setTitle:item.nameLabel.text forState:UIControlStateNormal];
        POPSpringAnimation*basicAniamtion = [POPSpringAnimation animationWithPropertyNamed:kPOPViewBackgroundColor];
        basicAniamtion.toValue= item.randomColor;
        [circularBtn pop_addAnimation:basicAniamtion forKey:@"colorized"];
    }
    
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    anim.toValue = [NSValue valueWithCGSize:CGSizeMake(1.0, 1.0)];
    [circularBtn pop_addAnimation:anim forKey:@"circularBtnZoomOut"];
    
    
    
}

-(void)openRadialMenu
{

    NSArray *btnList = @[@"- 1",@"- 2",@"- 3",@"- 4",@"- 5",@"- 6",@"- 7",@"- 8",@"- 9",@"- 10"];
    
    ASRadialMenu *menuView = [[ASRadialMenu alloc] initWithFrame:self.view.bounds];
    menuView.origin = self.view.center;
    menuView.items = btnList;
    menuView.delegate = self;
    [self.view addSubview:menuView];
    [menuView open];
    
    /*
    [UIView animateWithDuration:0.6 animations:^{
       circularBtn.frame = CGRectMake((self.view.bounds.size.width-kASMAXRadius)*0.5,
                                      (self.view.bounds.size.height-kASMAXRadius)*0.5,
                                      kASMAXRadius,
                                      kASMAXRadius);
        circularBtn.layer.cornerRadius = kASMAXRadius*0.5;
    }];
     */
    
    
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    anim.toValue = [NSValue valueWithCGSize:CGSizeMake(2.2, 2.2)];
    [circularBtn pop_addAnimation:anim forKey:@"circularBtnZoomIn"];

}

#pragma mark UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    originalFrame = CGRectMake((self.view.bounds.size.width-100)*0.5, (self.view.bounds.size.height-100)*0.5, 100.0, 100.0);
    
    
	circularBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    circularBtn.frame = originalFrame;
    circularBtn.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    [circularBtn setTitle:@"Press Me" forState:UIControlStateNormal];
    [circularBtn addTarget:self action:@selector(openRadialMenu) forControlEvents:UIControlEventTouchUpInside];
    circularBtn.layer.cornerRadius = 50.0;
    circularBtn.layer.masksToBounds = YES;
    circularBtn.AccessibilityLabel = @"openMenu";
    [self.view addSubview:circularBtn];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

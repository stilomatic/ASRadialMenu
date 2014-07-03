//
//  ASViewController.h
//  ASRadialMenu
//
//  Created by Antonio_Stilo on 7/3/14.
//  Copyright (c) 2014 Antonio_Stilo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASRadialMenu.h"
#import "ASRadialSelectionView.h"

@interface ASViewController : UIViewController <ASRadialMenuDelegate>

@property (nonatomic,strong) UIButton *circularBtn;

-(void)openRadialMenu;

@end

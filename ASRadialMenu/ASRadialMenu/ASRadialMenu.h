//
//  S2LWorldRadiantMenu.h
//  snap2life4.0
//
//  Created by iOS on 26.05.14.
//  Copyright (c) 2014 Prisma Gmbh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASRadialSelectionView.h"
#import "ASRadialSelectionViewDelegate.h"

@class ASRadialSelectionView;

#define kASDimension 60
#define kASScalefactor 1
#define kASMAXRadius 200
#define kASMINRadius 0

@protocol ASRadialMenuDelegate <NSObject>

@optional
-(void)closeRadialMenu:(ASRadialSelectionView*)view;

@end

@interface ASRadialMenu : UIView <ASRadialSelectionViewDelegate>
{

    CGFloat swipeRotationValue;
    CGFloat frictionAngle;
    CGFloat radius;

    ASRadialSelectionView *selectedView;
    
    CGPoint startLocation;
    CGPoint endLocation;
}

@property (nonatomic,weak) id<ASRadialMenuDelegate> delegate;
@property (nonatomic) CGFloat scale;
@property (nonatomic) CGPoint origin;
@property (nonatomic,strong) NSArray *items;

-(void)open;
-(void)close;

@end

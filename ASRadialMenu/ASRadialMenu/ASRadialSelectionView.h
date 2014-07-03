//
//  S2LARSelectionViewCell.h
//  snap2life4.0
//
//  Created by iOS on 22.05.14.
//  Copyright (c) 2014 Prisma Gmbh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASRadialMenu.h"
#import "ASRadialSelectionViewDelegate.h"

#define UIRandomColor [UIColor colorWithRed:(float)(arc4random()%122 /255.0)+0.5 green:(float)(arc4random()%122 /255.0)+0.5 blue:(float)(arc4random()%122 /255.0)+0.5 alpha:1.0]



@interface ASRadialSelectionView : UIView
{
    UIImageView *check;

}

@property (nonatomic,strong) UIColor *randomColor;
@property (nonatomic,weak) id<ASRadialSelectionViewDelegate> delegate;
@property (nonatomic) BOOL isSelected;
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,strong) UIImageView *icon;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UIButton *downloadBtn;

- (id)initWithFrame:(CGRect)frame andText:(NSString*)_label;

@end


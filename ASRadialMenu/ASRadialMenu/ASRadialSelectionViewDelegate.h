//
//  ASRadialSelectionViewDelegate.h
//  ASRadialMenu
//
//  Created by Antonio_Stilo on 7/3/14.
//  Copyright (c) 2014 Antonio_Stilo. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ASRadialSelectionView;

@protocol ASRadialSelectionViewDelegate <NSObject>

-(void)close:(ASRadialSelectionView*)view;

@end
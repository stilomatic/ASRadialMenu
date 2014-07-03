//
//  S2LWorldRadiantMenu.m
//  snap2life4.0
//
//  Created by iOS on 26.05.14.
//  Copyright (c) 2014 Prisma Gmbh. All rights reserved.
//

#import "ASRadialMenu.h"
#import "ASRadialSelectionView.h"



@implementation ASRadialMenu

@synthesize origin,items,scale,delegate;

-(CGPoint) getCircularPos:(float)_angle
{
	
	float a = M_PI/180 * _angle;
	float x = origin.x + (radius * sin(a));
	float y = origin.y + (radius * cos(a));
	return CGPointMake(x, y);
	
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
		
		swipeRotationValue = 0.0;
		frictionAngle = 0.0;
        radius = 0.0;
        scale = 0.01;
        
        UIButton *clearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat dimension = kASMAXRadius * 0.6;
        clearBtn.frame = CGRectMake((self.bounds.size.width - dimension) * 0.5, (self.bounds.size.height - dimension) * 0.5 ,dimension , dimension);
        [clearBtn addTarget:self action:@selector(closeHandler) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:clearBtn];

    }
    return self;
}

-(void)open
{
    [items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *item = (NSString*)obj;
        ASRadialSelectionView *view = [[ASRadialSelectionView alloc] initWithFrame:CGRectMake(origin.x, origin.y, 10, 10) andText:item];
        view.delegate = self;
        view.alpha = 0.0;
        [self addSubview:view];
    }];
    
    swipeRotationValue = 830.0;
    scale = 0.01;
    [NSTimer scheduledTimerWithTimeInterval:0.01  target:self selector:@selector(animationOpen:) userInfo:nil repeats:YES];

}

-(void)closeHandler
{
    selectedView = nil;
    [self close];
}

-(void)close:(ASRadialSelectionView*)_view
{
    selectedView = _view;
    [self close];
}
-(void)close
{
    swipeRotationValue += 720.0;
    [delegate performSelector:@selector(closeRadialMenu:) withObject:selectedView];
    [NSTimer scheduledTimerWithTimeInterval:0.01  target:self selector:@selector(animationClose:) userInfo:nil repeats:YES];
}

-(void)animationOpen:(NSTimer*)timer
{
    if(radius < kASMAXRadius)radius++;
    if (scale < kASScalefactor) {
        scale += 0.01;
    }
    [self animationSchedule:timer];
}

-(void)animationClose:(NSTimer*)timer
{
    if(radius > kASMINRadius)radius-=2;
    frictionAngle -= (frictionAngle-swipeRotationValue)/24;
	[self rotateMenu:frictionAngle];
    if (scale > 0.0) {
        scale -= 0.01;
    }
    else{
        [timer invalidate];
        [self removeFromSuperview];
    }
}

-(void)animationSchedule:(NSTimer*)timer
{
	
	frictionAngle -= (frictionAngle-swipeRotationValue)/24;
	[self rotateMenu:frictionAngle];
    
	if (ceil(swipeRotationValue) == (ceil(frictionAngle)+1)) {
		[timer invalidate];
	}
	
}

-(void)rotateMenu:(CGFloat)a
{
	CGFloat _angle = (360.0/(self.subviews.count-1));
	int i = 0;
	
	for (UIView *button in self.subviews) {
        if (![button isKindOfClass:[UIButton class]]) {
            CGFloat angle = (i*_angle);
            CGPoint pos = [self getCircularPos:angle-a];
            CGFloat scaleDimension = kASDimension * scale;
            CGRect newFrame = CGRectMake(pos.x-(scaleDimension*0.5), pos.y-(scaleDimension*0.5), scaleDimension, scaleDimension);
            button.frame = newFrame;
            button.alpha = scale;
            i++;
        }
	}
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    startLocation = [touch locationInView:self];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint moveLocation = [touch locationInView:self];
    
    CGFloat xx = moveLocation.x-startLocation.x;
    CGFloat yy = moveLocation.y-startLocation.y;
    CGFloat g = -0.01;
    if(startLocation.x > moveLocation.x) g = 0.01;
    CGFloat distance = sqrtf(xx*xx+yy*yy);
    swipeRotationValue += distance*g;
    [self rotateMenu:swipeRotationValue];
}

@end

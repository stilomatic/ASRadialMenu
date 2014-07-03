//
//  S2LARSelectionViewCell.m
//  snap2life4.0
//
//  Created by iOS on 22.05.14.
//  Copyright (c) 2014 Prisma Gmbh. All rights reserved.
//

#import "ASRadialSelectionView.h"
#import <POP.h>


@implementation ASRadialSelectionView
@synthesize isSelected,delegate,timer,nameLabel,downloadBtn,randomColor;

- (id)initWithFrame:(CGRect)frame andText:(NSString*)_label
{
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, 60, 60)];
    if (self) {
        
        [self removeConstraints:self.constraints];

        self.autoresizesSubviews = YES;
        self.randomColor = UIRandomColor;
        self.backgroundColor = self.randomColor;
        
        nameLabel = [UILabel new];
        nameLabel.frame = CGRectMake(0, 5, 57, 60);
        nameLabel.font = [UIFont boldSystemFontOfSize:10];
        nameLabel.numberOfLines = 2;
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.backgroundColor = [UIColor clearColor];
        nameLabel.layer.shadowOpacity = 1.0;
        nameLabel.layer.shadowRadius = 0.0;
        nameLabel.layer.shadowColor = [UIColor whiteColor].CGColor;
        nameLabel.layer.shadowOffset = CGSizeMake(0.0, -1.0);
        [self addSubview:nameLabel];
        
        [self.layer setCornerRadius:30];
        self.layer.masksToBounds = YES;
    
        nameLabel.text = _label;
        [nameLabel sizeToFit];
        nameLabel.frame = CGRectMake((60-nameLabel.frame.size.width)/2, (60-nameLabel.frame.size.width)/2, nameLabel.frame.size.width, nameLabel.frame.size.height);
        [self setIsSelected:NO];

    }
    return self;
}

-(void)downloadHandler
{
    self.isSelected = YES;
}

-(void)setIsSelected:(BOOL)_isSelected
{

    isSelected = _isSelected;
    
    if (isSelected) {
        
        POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        anim.toValue = [NSValue valueWithCGSize:CGSizeMake(1.6, 1.6)];
        [anim setCompletionBlock:^(POPAnimation *_anim, BOOL isCompleate) {
            [delegate performSelector:@selector(close:) withObject:self];
        }];
        [self pop_addAnimation:anim forKey:@"pop"];

        
    }else{
        
        downloadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        downloadBtn.frame = CGRectMake(0, 0, 60, 60);
        [downloadBtn addTarget:self action:@selector(downloadHandler) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:downloadBtn];
    }
}

@end

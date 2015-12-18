//
//  AnimateCollectionViewCell.m
//  SimpleAnimation
//
//  Created by 臧其龙 on 15/12/18.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import "AnimateCollectionViewCell.h"

@interface AnimateCollectionViewCell ()
{
    CAShapeLayer *chartButtonMaskLayer;
    
    UIBezierPath *littleRoundMask;
    UIBezierPath *bigRoundMask;
}

@end

@implementation AnimateCollectionViewCell

- (void)awakeFromNib
{
    _plusButton.currentState = TBAnimationButtonStateCross;
    _plusButton.lineWidth = 10;
    
    chartButtonMaskLayer = [CAShapeLayer layer];
    littleRoundMask = [UIBezierPath bezierPathWithRoundedRect:_addchartButton.bounds cornerRadius:10];
    bigRoundMask = [UIBezierPath bezierPathWithRoundedRect:_buttonContainerView.bounds cornerRadius:20];
    chartButtonMaskLayer.path = littleRoundMask.CGPath;
    _addchartButton.layer.mask = chartButtonMaskLayer;
    _unexpandBottomViewButton.alpha = 0;
    
    [_containerView bringSubviewToFront:_imageContainerView];
    _leftButton.alpha = 1;
    _rightButton.alpha = 1;
}

- (void)unExpandAnimation
{
    _plusButton.currentState = TBAnimationButtonStatePlus;
    _traillingConstraints.constant = CGRectGetWidth([UIScreen mainScreen].bounds)/2 + 10;
    _viewBottomConstraint.constant = 0;
    _viewLeftConstraint.constant = 0;
    _viewTopConstraint.constant = 0;
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.contentView layoutIfNeeded];
        _leftButton.alpha = 0;
        _rightButton.alpha = 0;
    } completion:^(BOOL finished) {
        
    }];
//    [UIView animateWithDuration:5 animations:^{
//        [self layoutIfNeeded];
//    }];
}

- (void)expandAnimation
{
    _plusButton.currentState = TBAnimationButtonStateCross;
    _traillingConstraints.constant = 50;
    _viewBottomConstraint.constant = 10;
    _viewLeftConstraint.constant = 10;
    _viewTopConstraint.constant = 10;
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.contentView layoutIfNeeded];
        _leftButton.alpha = 1;
        _rightButton.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}

- (IBAction)openButtonDidClick:(id)sender
{
    if (_viewLeftConstraint.constant == 10.0) {
        [self unExpandAnimation];
    }else
    {
       [self expandAnimation];
    }
    
}

- (IBAction)chartButtonDidClick:(id)sender
{
    [self unexpandBottomView];
}

- (IBAction)unExpandButtonDidClick:(id)sender
{
    [self expandBottomView];
}

- (void)expandBottomView
{
    UIColor *backcolor = [UIColor clearColor];
    
    [UIView animateWithDuration:0.5 animations:^{
        _maskView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        _maskView.backgroundColor = backcolor;
    }];
    
    [UIView animateWithDuration:0.5 animations:^{
        _unexpandBottomViewButton.alpha = 0;
    } completion:^(BOOL finished) {
        [_buttonContainerView sendSubviewToBack:_unexpandBottomViewButton];
    }];

}

- (void)unexpandBottomView
{
    UIColor *backcolor = [UIColor colorWithRed:75.0/255 green:151/255.0 blue:96/255.0 alpha:1];
    _maskView.backgroundColor = backcolor;
    [UIView animateWithDuration:0.5 animations:^{
        _maskView.transform = CGAffineTransformMakeScale(10, 10);
    } completion:^(BOOL finished) {
        
    }];
    [_buttonContainerView bringSubviewToFront:_unexpandBottomViewButton];
    [UIView animateWithDuration:0.5 animations:^{
        _unexpandBottomViewButton.alpha = 1;
    }];

}

@end

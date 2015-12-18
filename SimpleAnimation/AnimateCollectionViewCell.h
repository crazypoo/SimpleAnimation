//
//  AnimateCollectionViewCell.h
//  SimpleAnimation
//
//  Created by 臧其龙 on 15/12/18.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBAnimationButton.h"

@interface AnimateCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *traillingConstraints;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewLeftConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewBottomConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewTopConstraint;
@property (weak, nonatomic) IBOutlet UIView *imageContainerView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *addchartButton;
@property (weak, nonatomic) IBOutlet UIView *buttonContainerView;
@property (weak, nonatomic) IBOutlet UIView *maskView;
@property (weak, nonatomic) IBOutlet UIButton *unexpandBottomViewButton;
@property (weak, nonatomic) IBOutlet TBAnimationButton *plusButton;

@end

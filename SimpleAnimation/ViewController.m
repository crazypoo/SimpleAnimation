//
//  ViewController.m
//  SimpleAnimation
//
//  Created by 臧其龙 on 15/12/18.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import "ViewController.h"
#import "AnimateCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    CGSize itemSize;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    itemSize = CGSizeMake(CGRectGetWidth(self.view.bounds), CGRectGetWidth(self.view.bounds) * 0.6);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CollectionView DataSource && Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AnimateCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"kAnimationCell" forIndexPath:indexPath];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return itemSize;
}

@end

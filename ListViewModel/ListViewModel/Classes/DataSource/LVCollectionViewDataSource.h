//
//  ListViewModelCollectionViewModel.h
//  clh
//
//  Created by 曹连华 on 2018/4/11.
//  Copyright © 2018年 曹连华. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "BaseDataSource.h"
#import "LVCollectionCellRegisterModel.h"

@protocol CollectionViewCustomDataSource <UICollectionViewDataSource>

@required

- (UICollectionReusableView *)collectionViewModel:(UICollectionView *)collectionView
                viewForSupplementaryElementOfKind:(NSString *)kind
                                      atIndexPath:(NSIndexPath *)indexPath
                                     sectionModel:(LVBaseCellSectionModel *)sectionModel;

@optional

- (UICollectionViewCell *)collectionViewModel:(UICollectionView *)collectionView
                       cellForItemAtIndexPath:(NSIndexPath *)indexPath
                                     rowModel:(LVBaseCellRowModel *)rowModel;

@end

@interface LVCollectionViewDataSource : BaseDataSource <UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>


- (instancetype)initWithDataSource:(id<CollectionViewCustomDataSource>)dataSource;

- (void)collectionView:(UICollectionView *)collectionView register:(NSArray <LVCollectionCellRegisterModel *>*)registerInfos;

- (void)resetDataSource:(id<CollectionViewCustomDataSource>)dataSource;

@end


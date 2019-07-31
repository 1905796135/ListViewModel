//
//  ListViewModelCollectionViewModel.m
//  clh
//
//  Created by 曹连华 on 2018/4/11.
//  Copyright © 2018年 曹连华. All rights reserved.
//

#import "LVCollectionViewDataSource.h"
#import "LVBaseCollectionViewCell.h"

@interface LVCollectionViewDataSource ()

@property (nonatomic, weak) id <CollectionViewCustomDataSource> collectionViewDataSource;

@end

@implementation LVCollectionViewDataSource

- (instancetype)initWithDataSource:(id<CollectionViewCustomDataSource>)dataSource {
    self = [super init];
    if (self) {
        self.collectionViewDataSource = dataSource;
    }
    return self;
}

- (void)resetDataSource:(id<CollectionViewCustomDataSource>)dataSource {
    self.collectionViewDataSource = dataSource;
}

#pragma mark - CollectionView - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if([self.collectionViewDataSource respondsToSelector:@selector(numberOfSectionsInCollectionView:)]) {
        return [self.collectionViewDataSource numberOfSectionsInCollectionView:collectionView];
    }
    return self.sections.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if ([self.collectionViewDataSource respondsToSelector:@selector(collectionView:numberOfItemsInSection:)]) {
        [self.collectionViewDataSource collectionView:collectionView numberOfItemsInSection:section];
    }
    return [self sectionModelAtIndex:section].rows.count;
}

- (LVBaseCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LVBaseCellRowModel *rowModel = [self rowModelAtIndex:indexPath];
    
    if ([self.collectionViewDataSource respondsToSelector:@selector(collectionViewModel:cellForItemAtIndexPath:rowModel:)]) {
        
        return (LVBaseCollectionViewCell *)[self.collectionViewDataSource collectionViewModel:collectionView cellForItemAtIndexPath:indexPath rowModel:rowModel];
        
    } else {
        LVBaseCollectionViewCell *cell = (LVBaseCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:rowModel.reuseIdentifier forIndexPath:indexPath];
        if (!cell) {
            if (rowModel.loadType == TVCCellLoadXIB) {
                cell = (LVBaseCollectionViewCell *)[rowModel createCVCCellByXIB];
            } else {
                cell = (LVBaseCollectionViewCell *)[rowModel createCVCCellByCode];
            }
        }
        [cell updateCVCCellWithRowModel:rowModel atIndexPath:indexPath];
        
        return cell;
    }
}
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self rowModelAtIndex:indexPath].canMove;
}
- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath {
    LVBaseCellRowModel *sourceRow = [self rowModelAtIndex:sourceIndexPath];
    
    LVBaseCellSectionModel *sourceSectionModel = [self sectionModelAtIndex:sourceIndexPath.section];
    LVBaseCellSectionModel *destinationSectionModel = [self sectionModelAtIndex:destinationIndexPath.section];
    [sourceSectionModel.rows removeObjectAtIndex:sourceIndexPath.row];//先把原来位置的 rowModel 删除
    
    if (sourceIndexPath.section == destinationIndexPath.section) {//同组 移动
        [sourceSectionModel.rows insertObject:sourceRow atIndex:destinationIndexPath.row];
    } else {// 不同组移动
        [destinationSectionModel.rows insertObject:sourceRow atIndex:destinationIndexPath.row];
    }
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    LVBaseCellSectionModel *sectionModel = [self sectionModelAtIndex:indexPath.section];
    if (self.collectionViewDataSource && [self.collectionViewDataSource respondsToSelector:@selector(collectionViewModel:viewForSupplementaryElementOfKind:atIndexPath:sectionModel:)]) {
        return [self.collectionViewDataSource collectionViewModel:collectionView viewForSupplementaryElementOfKind:kind atIndexPath:indexPath sectionModel:sectionModel];
    }
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView register:(NSArray <LVCollectionCellRegisterModel *>*)registerInfos {
    for (LVCollectionCellRegisterModel *info in registerInfos) {
        switch (info.registerType) {
            case RegisterTypeCVCCell:
                if (info.loadType == TVCCellLoadXIB) {
                    [collectionView registerNib:[UINib nibWithNibName:info.reuseIdentifier bundle:nil] forCellWithReuseIdentifier:info.reuseIdentifier];
                } else {
                    [collectionView registerClass:NSClassFromString(info.reuseIdentifier) forCellWithReuseIdentifier:info.reuseIdentifier];
                }
                break;
            case RegisterTypeHeader:
                if (info.loadType == TVCCellLoadXIB) {
                    [collectionView registerNib:[UINib nibWithNibName:info.reuseIdentifier bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:info.reuseIdentifier];
                } else {
                    [collectionView registerClass:NSClassFromString(info.reuseIdentifier) forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:info.reuseIdentifier];
                }
                break;
            case RegisterTypeFooter:
                if (info.loadType == TVCCellLoadXIB) {
                     [collectionView registerNib:[UINib nibWithNibName:info.reuseIdentifier bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:info.reuseIdentifier];
                } else {
                    [collectionView registerClass:NSClassFromString(info.reuseIdentifier) forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:info.reuseIdentifier];
                }
                break;
            default:
                break;
        }
    }
}

@end

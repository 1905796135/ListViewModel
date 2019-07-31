//
//  BaseDataSource.m
//  clh
//
//  Created by 曹连华 on 2018/4/10.
//  Copyright © 2018年 曹连华. All rights reserved.
//

#import "BaseDataSource.h"
#import <UIKit/NSIndexPath+UIKitAdditions.h>
@implementation BaseDataSource

- (NSMutableArray <LVBaseCellSectionModel *> *)sections {
    if(!_sections) {
        _sections  = [NSMutableArray<LVBaseCellSectionModel *> array];
    }
    return _sections;
}

- (LVBaseCellSectionModel *_Nonnull)sectionModelAtIndex:(NSInteger)section {
    NSAssert(self.sections.count - 1 >= section,@"indexPath.section 导致 sections 数组越界");
    return [self.sections objectAtIndex:section];
}

- (LVBaseCellRowModel *_Nonnull)rowModelAtIndex:(NSIndexPath *_Nonnull)indexPath {
    return [[self sectionModelAtIndex:indexPath.section] rowModelAtIndex:indexPath];
}

- (void)resetRowListInSection:(NSArray <LVBaseCellRowModel *>*_Nonnull)rowArray {
    [self.sections removeAllObjects];
    if (rowArray) {
        [self.sections addObjectsFromArray:@[[[LVBaseCellSectionModel alloc]initWithRowList:rowArray]]];
    }
}

- (void)resetSectionList:(NSArray <LVBaseCellSectionModel *>*_Nonnull)sectionArray {
    [self.sections removeAllObjects];
    if(sectionArray){
        [self.sections addObjectsFromArray:sectionArray];
    }
}

- (void)insertRowModel:(LVBaseCellRowModel * _Nonnull )rowModel atIndex:(NSIndexPath *_Nonnull)indexPath {
    NSAssert(self.sections.count - 1 >= indexPath.section,@"indexPath.section 导致 sections 数组越界");
    LVBaseCellSectionModel *sectionModel = [self sectionModelAtIndex:indexPath.section];
    
    NSAssert(sectionModel.rows.count -1  >= indexPath.row,@"indexPath.row 导致 sectionModel.rows 数组越界");
    [sectionModel.rows insertObject:rowModel atIndex:indexPath.row];
}

- (void)insertSectionModel:(LVBaseCellSectionModel * _Nonnull )sectionModel atSection:(NSInteger)section {
    NSAssert(self.sections.count - 1 >= section,@"section 导致 sections 数组越界");
    [self.sections insertObject:sectionModel atIndex:section];
}

- (void)addRowModel:(LVBaseCellRowModel * _Nonnull )rowMode {
    NSAssert(rowMode != nil,@"rowMode 不能为nil ");
    LVBaseCellSectionModel *lastSectionModel = self.sections.lastObject;
    [lastSectionModel.rows addObject:rowMode];
}

- (void)addSectionModel:(LVBaseCellSectionModel * _Nonnull)sectionModel {
    NSAssert(sectionModel != nil,@"sectionModel 不能为nil ");
    [self.sections addObject:sectionModel];
}

- (void)removeRowModelAtIndex:(NSIndexPath *)indexPath {
    NSAssert(self.sections.count - 1 >= indexPath.section,@"indexPath.section 导致 sections 数组越界");
    LVBaseCellSectionModel *sectionModel = [self.sections objectAtIndex:indexPath.section];
    
    NSAssert(sectionModel.rows.count -1  >= indexPath.row,@"indexPath.row 导致 sectionModel.rows 数组越界");
    [sectionModel.rows removeObjectAtIndex:indexPath.row];
}

- (void)removeSectionModelAtSection:(NSInteger)section {
    NSAssert(self.sections.count - 1 >= section,@"section 导致 sections 数组越界");
    [self.sections removeObjectAtIndex:section];
}

- (void)removeRowModel:(LVBaseCellRowModel *)rowModel {
    for (LVBaseCellSectionModel *sectionModel in self.sections) {
        if ([sectionModel.rows containsObject:rowModel]) {
            [sectionModel.rows removeObject:rowModel];
        }
    }
}

- (void)removeSectionModel:(LVBaseCellSectionModel *)sectionModel {
    if ([self.sections containsObject:sectionModel]) {
        [self.sections removeObject:sectionModel];
    }
}
@end

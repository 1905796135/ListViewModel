//
//  BaseDataSource.h
//  clh
//
//  Created by 曹连华 on 2018/4/10.
//  Copyright © 2018年 曹连华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LVBaseCellSectionModel.h"

@interface BaseDataSource : NSObject

@property (nonatomic, strong) NSMutableArray <LVBaseCellSectionModel *>* _Nonnull sections;

- (LVBaseCellSectionModel *_Nonnull)sectionModelAtIndex:(NSInteger)section;

- (LVBaseCellRowModel *_Nonnull)rowModelAtIndex:(NSIndexPath *_Nonnull)indexPath;

- (void)resetRowListInSection:(NSArray <LVBaseCellRowModel *>*_Nonnull)rowArray;

- (void)resetSectionList:(NSArray <LVBaseCellSectionModel *>*_Nonnull)sectionArray;

/**
 * 插入一条 rowModel 数据 atIndex : indexPath
 */
- (void)insertRowModel:(LVBaseCellRowModel * _Nonnull )rowModel atIndex:(NSIndexPath *_Nonnull)indexPath;

/**
 * 插入一条 sectionModel 数据 atSection : section
 */
- (void)insertSectionModel:(LVBaseCellSectionModel * _Nonnull )sectionModel atSection:(NSInteger)section;

/*
 * 增加一条 rowModel 数据 at 数据源末尾
 */
- (void)addRowModel:(LVBaseCellRowModel * _Nonnull )rowMode;

/**
 * 增加一条 sectionModel 数据 at 数据源末尾
 */
- (void)addSectionModel:(LVBaseCellSectionModel * _Nonnull)sectionModel;

/*
 * 删除一条 rowModel 数据 atIndex : indexPath
 */
- (void)removeRowModelAtIndex:(NSIndexPath *_Nonnull)indexPath;

/*
 * 删除一条 sectionModel 数据 atSection : section
 */
- (void)removeSectionModelAtSection:(NSInteger)section;

/*
 * 删除一条 rowModel 数据
 */
- (void)removeRowModel:(LVBaseCellRowModel *_Nonnull)rowModel;

/*
 * 删除一条 sectionModel
 */
- (void)removeSectionModel:(LVBaseCellSectionModel *_Nonnull)sectionModel;

@end

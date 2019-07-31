//
//  LVBaseCellSectionModel.h
//  clh
//
//  Created by 曹连华 on 2018/4/9.
//  Copyright © 2018年 曹连华. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "LVBaseSectionHeaderFooterModel.h"
#import "LVBaseCellRowModel.h"

@interface LVBaseCellSectionModel : NSObject

@property (nonatomic, strong) NSMutableArray <LVBaseCellRowModel*> *rows;

@property (nonatomic, strong) LVBaseSectionHeaderFooterModel *sectionHeader;
@property (nonatomic, strong) LVBaseSectionHeaderFooterModel *sectionFooter;

#pragma mark - for CollectionCell
@property (nonatomic, assign) CGFloat minimumLineSpacing;
@property (nonatomic, assign) CGFloat minimumInteritemSpacing;

- (instancetype)initWithRowList:(NSArray<LVBaseCellRowModel*> *)rowArray;

- (LVBaseCellRowModel *)rowModelAtIndex:(NSIndexPath *)indexPath;

@end

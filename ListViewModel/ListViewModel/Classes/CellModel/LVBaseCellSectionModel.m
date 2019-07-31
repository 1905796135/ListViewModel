//
//  LVBaseCellSectionModel.m
//  clh
//
//  Created by 曹连华 on 2018/4/9.
//  Copyright © 2018年 曹连华. All rights reserved.
//

#import "LVBaseCellSectionModel.h"
#import <UIKit/NSIndexPath+UIKitAdditions.h>
@implementation LVBaseCellSectionModel

- (instancetype)initWithRowList:(NSArray<LVBaseCellRowModel*> *)rowArray {
    self = [super init];
    if (self) {
        [self.rows addObjectsFromArray:rowArray];
    }
    return self;
}
- (NSMutableArray <LVBaseCellRowModel *>*)rows {
    if(!_rows) {
        _rows = [NSMutableArray<LVBaseCellRowModel *> array];
    }
    return _rows;
}

- (LVBaseCellRowModel *)rowModelAtIndex:(NSIndexPath *)indexPath {
    NSAssert(self.rows.count >= indexPath.row + 1,@"LVBaseCellSectionModel rows 数组越界");
    return [self.rows objectAtIndex:indexPath.row] ? [self.rows objectAtIndex:indexPath.row] : nil;
    
}

@end

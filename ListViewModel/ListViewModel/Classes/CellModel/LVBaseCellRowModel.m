//
//  LVBaseCellRowModel.m
//  clh
//
//  Created by 曹连华 on 2018/4/9.
//  Copyright © 2018年 曹连华. All rights reserved.
//

#import "LVBaseCellRowModel.h"

@implementation LVBaseCellRowModel  {
    Class _cellClass;
}

- (instancetype)initWithCellClass:(NSString *)cellClassStr {
    self = [self initWithCellClass:cellClassStr userInfo:nil];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithCellClass:(NSString *)cellClassStr userInfo:(id)userInfo {
    self = [super init];
    if (self) {
        self.canEdit = NO;
        self.titleForEdit = @"删除";
        self.reuseIdentifier = cellClassStr;
        _cellClass = NSClassFromString(cellClassStr);
        self.userInfo = userInfo;
        self.loadType = TVCCellLoadCode;
    }
    return self;
}

#pragma mark - UITableView
- (Class)createTVCCellByCode {
    _cellClass = _cellClass ? _cellClass : NSClassFromString(@"UITableViewCell");
    self.reuseIdentifier = self.reuseIdentifier.length > 0 ? self.reuseIdentifier : @"UITableViewCell";
    return [[_cellClass alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.reuseIdentifier];
}
- (Class)createTVCCellByXIB {
    self.reuseIdentifier = self.reuseIdentifier.length > 0 ? self.reuseIdentifier : @"UITableViewCell";
    return [[[NSBundle mainBundle]loadNibNamed:self.reuseIdentifier owner:nil options:nil] firstObject];
    
}

#pragma mark -UICollectionView
- (Class)createCVCCellByCode {
    _cellClass = _cellClass ? _cellClass : NSClassFromString(@"UICollectionViewCell");
    self.reuseIdentifier = self.reuseIdentifier.length > 0 ? self.reuseIdentifier : @"UICollectionViewCell";
    return [[_cellClass alloc]initWithFrame:CGRectZero];
}
- (Class )createCVCCellByXIB {
    self.reuseIdentifier = self.reuseIdentifier.length > 0 ? self.reuseIdentifier : @"UICollectionViewCell";
    return [[[NSBundle mainBundle]loadNibNamed:self.reuseIdentifier owner:nil options:nil] firstObject];
    
}
@end


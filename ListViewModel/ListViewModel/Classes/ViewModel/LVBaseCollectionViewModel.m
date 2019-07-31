//
//  LVBaseCollectionViewModel.m
//  BaseCode
//
//  Created by 曹连华 on 2019/6/20.
//  Copyright © 2019 曹连华. All rights reserved.
//

#import "LVBaseCollectionViewModel.h"

@interface LVBaseCollectionViewModel ()

@property (nonatomic, strong) LVCollectionViewDataSource *dataSource;

@end

@implementation LVBaseCollectionViewModel
- (LVCollectionViewDataSource *)dataSource {
    if (!_dataSource) {
        _dataSource = [[LVCollectionViewDataSource alloc]init];
    }
    return _dataSource;
}
@end

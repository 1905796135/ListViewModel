//
//  LVBaseTableViewModel.m
//  BaseCode
//
//  Created by 曹连华 on 2019/6/20.
//  Copyright © 2019 曹连华. All rights reserved.
//

#import "LVBaseTableViewModel.h"

@interface LVBaseTableViewModel ()

@property (nonatomic, strong) LVTableViewDataSource *dataSource;

@end

@implementation LVBaseTableViewModel

- (LVTableViewDataSource *)dataSource {
    if (!_dataSource) {
        _dataSource = [[LVTableViewDataSource alloc]init];
    }
    return _dataSource;
}

@end

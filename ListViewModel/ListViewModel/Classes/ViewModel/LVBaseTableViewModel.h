//
//  LVBaseTableViewModel.h
//  BaseCode
//
//  Created by 曹连华 on 2019/6/20.
//  Copyright © 2019 曹连华. All rights reserved.
//

#import "LVBaseViewModel.h"
#import "LVTableViewDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface LVBaseTableViewModel : LVBaseViewModel

@property (nonatomic, strong,readonly) LVTableViewDataSource *dataSource;

@end

NS_ASSUME_NONNULL_END

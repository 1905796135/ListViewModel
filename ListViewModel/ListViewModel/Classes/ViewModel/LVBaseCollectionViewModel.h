//
//  LVBaseCollectionViewModel.h
//  BaseCode
//
//  Created by 曹连华 on 2019/6/20.
//  Copyright © 2019 曹连华. All rights reserved.
//

#import "LVBaseViewModel.h"
#import "LVCollectionViewDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface LVBaseCollectionViewModel : LVBaseViewModel

@property (nonatomic, strong, readonly) LVCollectionViewDataSource *dataSource;

@end

NS_ASSUME_NONNULL_END

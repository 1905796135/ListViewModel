//
//  LVBaseViewModel.h
//  Base
//
//  Created by 曹连华 on 2019/3/13.
//  Copyright © 2019 曹连华. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LVBaseOperateProtocol.h"

@interface LVBaseViewModel : NSObject

- (instancetype)initWithDelegate:(id<LVBaseOperateDelegate>)delegate;
- (instancetype)initWithDelegate:(id<LVBaseOperateDelegate>)delegate logic:(id)logic;
- (void)initViewModel;
- (void)didSelectedRowModelWithindexPath:(NSIndexPath *)indexPath;

@end


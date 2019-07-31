//
//  LVBaseViewModel.m
//  Base
//
//  Created by 曹连华 on 2019/3/13.
//  Copyright © 2019 曹连华. All rights reserved.
//

#import "LVBaseViewModel.h"
#import "LVBaseViewModel+operate.h"

@interface LVBaseViewModel ()

@end

@implementation LVBaseViewModel

- (instancetype)initWithDelegate:(id<LVBaseOperateDelegate>)delegate logic:(id)logic {
    self = [self initWithDelegate:delegate];
    if (self) {
        
    }
    return self;
}
- (instancetype)initWithDelegate:(id<LVBaseOperateDelegate>)delegate {
    self = [super init];
    if (self) {
        self.delegate = delegate;
        [self initViewModel];
    }
    return self;
}
- (void)initViewModel {
    
}
- (void)didSelectedRowModelWithindexPath:(NSIndexPath *)indexPath {
    
}

@end

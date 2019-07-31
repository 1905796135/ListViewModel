//
//  LVBaseViewModel+operate.m
//  Base
//
//  Created by 曹连华 on 2019/3/13.
//  Copyright © 2019 曹连华. All rights reserved.
//

#import "LVBaseViewModel+operate.h"

#import <objc/runtime.h>

@implementation LVBaseViewModel (operate)

- (void)setDelegate:(id<LVBaseOperateDelegate>)delegate {
    objc_setAssociatedObject(self, @selector(delegate), delegate, OBJC_ASSOCIATION_ASSIGN);
}

- (id<LVBaseOperateDelegate>)delegate {
    return objc_getAssociatedObject(self, _cmd);
}

/**
 *  功能:显示loading
 */
- (void)showLoading {
    if ([self.delegate respondsToSelector:@selector(showLoading)]) {
        [self.delegate showLoading];
    }
}

/**
 *  功能:显示loading
 */
- (void)showLoadingWithMessage:(NSString *)message {
    if ([self.delegate respondsToSelector:@selector(showLoadingWithMessage:)]) {
        [self.delegate showLoadingWithMessage:message];
    }
}

/**
 *  功能:显示loading
 */
- (void)showLoadingWithMessage:(NSString *)message hideAfter:(NSTimeInterval)second {
    if ([self.delegate respondsToSelector:@selector(showLoadingWithMessage:hideAfter:)]) {
        [self.delegate showLoadingWithMessage:message hideAfter:second];
    }
    
}

- (void)showLoadingWithMessage:(NSString *)message hideAfter:(NSTimeInterval)second isModal:(BOOL)isModal {
    if ([self.delegate respondsToSelector:@selector(showLoadingWithMessage:hideAfter:isModal:)]) {
        [self.delegate showLoadingWithMessage:message hideAfter:second isModal:isModal];
    }
}

/**
 *  功能:隐藏loading
 */
- (void)hideLoading {
    if ([self.delegate respondsToSelector:@selector(hideLoading)]) {
        [self.delegate hideLoading];
    }
}

/**
 * 功能:刷新UITableView
 */
- (void)reloadTableView {
    if ([self.delegate respondsToSelector:@selector(vc_reload_TableView)]) {
        [self.delegate vc_reload_TableView];
    }
}

/**
 * 功能刷新 UICollectionView
 */
- (void)reloadCollectionView {
    if ([self.delegate respondsToSelector:@selector(vc_reload_CollectionView)]) {
        [self.delegate vc_reload_CollectionView];
    }
}

@end

//
//  LVBaseViewModel+operate.h
//  Base
//
//  Created by 曹连华 on 2019/3/13.
//  Copyright © 2019 曹连华. All rights reserved.
//

#import "LVBaseViewModel.h"

@interface LVBaseViewModel (operate)

- (void)setDelegate:(id<LVBaseOperateDelegate>)delegate;

- (id<LVBaseOperateDelegate>)delegate;

/**
 *  功能:显示loading (菊花转)
 */
- (void)showLoading;

/**
 *  功能:显示在View 中间显示一段文描 message
 */
- (void)showLoadingWithMessage:(NSString *)message;

/**
 *  功能:显示在View 中间显示一段文描 message second秒后消失
 */
- (void)showLoadingWithMessage:(NSString *)message hideAfter:(NSTimeInterval)second;
/**
 *  功能:显示在View 中间显示一段文描 message second秒后消失 isModal 文描是否可点击
 */
- (void)showLoadingWithMessage:(NSString *)message hideAfter:(NSTimeInterval)second isModal:(BOOL)isModal;

/**
 *  功能:隐藏loading
 */
- (void)hideLoading;

/**
 * 功能:刷新UITableView
 */
- (void)reloadTableView;

/**
 * 功能刷新 UICollectionView
 */
- (void)reloadCollectionView;

@end


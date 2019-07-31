//
//  ListBaseProtocol.h
//  Base
//
//  Created by 曹连华 on 2019/3/13.
//  Copyright © 2019 曹连华. All rights reserved.
//

#ifndef LVBaseOperateProtocol_h
#define LVBaseOperateProtocol_h


#endif /* LVBaseOperateProtocol_h */

@protocol LVBaseOperateDelegate <NSObject>

@optional

/**
 *  功能:显示loading
 */
- (void)showLoading;

/**
 *  功能:显示loading
 */
- (void)showLoadingWithMessage:(NSString *)message;

/**
 *  功能:显示loading
 */
- (void)showLoadingWithMessage:(NSString *)message hideAfter:(NSTimeInterval)second;

- (void)showLoadingWithMessage:(NSString *)message hideAfter:(NSTimeInterval)second isModal:(BOOL)isModal;

/**
 *  功能:隐藏loading
 */
- (void)hideLoading;

/**
 * 功能:刷新UITableView
 */
- (void)vc_reload_TableView;


/**
 * 功能刷新 UICollectionView
 */
- (void)vc_reload_CollectionView;

@end

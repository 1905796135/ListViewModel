//
//  LVBaseVC.h
//  BaseCode
//
//  Created by 曹连华 on 2019/4/1.
//  Copyright © 2019 曹连华. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LVBaseOperateProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface LVBaseVC : UIViewController <LVBaseOperateDelegate>

/**
 * 功能:刷新UITableView
 */
- (void)vc_reload_TableView;


/**
 * 功能刷新 UICollectionView
 */
- (void)vc_reload_CollectionView;

@end

NS_ASSUME_NONNULL_END

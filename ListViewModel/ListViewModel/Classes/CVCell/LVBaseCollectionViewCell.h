//
//  LVBaseCollectionViewCell.h
//  BaseCode
//
//  Created by 曹连华 on 2019/3/25.
//  Copyright © 2019 曹连华. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LVBaseCellRowModel;

NS_ASSUME_NONNULL_BEGIN

@interface LVBaseCollectionViewCell : UICollectionViewCell

- (void)initUI;

- (void)updateCVCCellWithRowModel:(LVBaseCellRowModel *)rowModel atIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END

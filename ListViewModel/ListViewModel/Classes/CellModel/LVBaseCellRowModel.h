//
//  LVBaseCellRowModel.h
//  clh
//
//  Created by 曹连华 on 2018/4/9.
//  Copyright © 2018年 曹连华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TVCCellLoadType) {
    TVCCellLoadCode,
    TVCCellLoadXIB
};

@interface LVBaseCellRowModel : NSObject

@property (nonatomic, strong) NSString *reuseIdentifier;
@property (nonatomic, strong) NSString *mainTitle;
@property (nonatomic, strong) NSString *subTitle;
@property (nonatomic, assign) TVCCellLoadType loadType;
@property (nonatomic, strong) id userInfo;

/**
 * 当前row 是否可编辑 例如删除当前行 defout NO
 * 如果设置为YES 需要 同时设置 editingStyle 的编辑类型
 */
@property (nonatomic, assign) BOOL canEdit;

/**
 * 当前row 是否可移动 defout NO
 */
@property (nonatomic, assign) BOOL canMove;

/**
 * 编辑状态下 cell 左滑 显示的文描  defout "删除"
 */
@property (nonatomic, strong) NSString *titleForEdit;

- (instancetype)initWithCellClass:(NSString *)cellClassStr;

- (instancetype)initWithCellClass:(NSString *)cellClassStr userInfo:(id)userInfo;


#pragma mark - for UITableView
/**
 * 可编辑类型  defout UITableViewCellEditingStyleNone
 */
@property (nonatomic, assign) UITableViewCellEditingStyle editingStyle;
@property (nonatomic, assign) UITableViewRowAnimation editingAnimationStyle;
@property (nonatomic, assign) CGFloat rowHeight;

- (Class)createTVCCellByCode;
- (Class)createTVCCellByXIB;

#pragma mark - for CollectionCell
@property (nonatomic, assign) CGSize rowSize;
- (Class)createCVCCellByCode;
- (Class)createCVCCellByXIB;





@end

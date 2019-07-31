//
//  LVBaseCollectionViewCell.m
//  BaseCode
//
//  Created by 曹连华 on 2019/3/25.
//  Copyright © 2019 曹连华. All rights reserved.
//

#import "LVBaseCollectionViewCell.h"
#import "LVBaseCellRowModel.h"

@implementation LVBaseCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    

}

- (void)updateCVCCellWithRowModel:(LVBaseCellRowModel *)rowModel atIndexPath:(NSIndexPath *)indexPath {
    
}

@end

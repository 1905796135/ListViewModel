//
//  LVBaseTableViewTVCell.m
//  BaseCode
//
//  Created by 曹连华 on 2019/3/25.
//  Copyright © 2019 曹连华. All rights reserved.
//

#import "LVBaseTableViewTVCell.h"
#import "LVBaseCellRowModel.h"

@implementation LVBaseTableViewTVCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.cellStyle = UITableViewCellStyleDefault;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self initUI];
    }
    return self;
}

- (void)initUI {
    
}

- (void)updateTVCCellWithRowModel:(LVBaseCellRowModel *)rowModel atIndexPath:(NSIndexPath *)indexPath {
    self.textLabel.text = rowModel.mainTitle;
    self.detailTextLabel.text = rowModel.subTitle;
}

@end

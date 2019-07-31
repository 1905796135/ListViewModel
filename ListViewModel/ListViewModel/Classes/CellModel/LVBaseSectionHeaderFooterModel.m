//
//  LVBaseSectionHeaderFooterModel.m
//  clh
//
//  Created by 曹连华 on 2018/4/11.
//  Copyright © 2018年 曹连华. All rights reserved.
//

#import "LVBaseSectionHeaderFooterModel.h"

@implementation LVBaseSectionHeaderFooterModel

- (instancetype)initWithSize:(CGSize)size itemInfo:(id)itemInfo reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super init];
    if (self) {
        self.size = size;
        self.itemInfo = itemInfo;
        self.reuseIdentifier = reuseIdentifier;
    }
    return self;
}

@end

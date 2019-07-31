//
//  LVCollectionCellRegisterModel.m
//  clh
//
//  Created by 曹连华 on 2018/4/11.
//  Copyright © 2018年 曹连华. All rights reserved.
//

#import "LVCollectionCellRegisterModel.h"

@implementation LVCollectionCellRegisterModel

- (instancetype)initWith:(NSString *)reuseIdentifier loadType:(LoadType)loadType registerType:(CVCellRegisterType)registerType {
    self = [super init];
    if (self) {
        self.loadType = loadType;
        self.registerType = registerType;
        switch (registerType) {
            case RegisterTypeCVCCell:
                self.reuseIdentifier = (reuseIdentifier.length > 0)?reuseIdentifier : @"UICollectionViewCell";
                break;
            case RegisterTypeHeader:
                self.reuseIdentifier = (reuseIdentifier.length > 0)?reuseIdentifier : @"UICollectionElementKindSectionHeader";
                break;
              
            case RegisterTypeFooter:
                self.reuseIdentifier = (reuseIdentifier.length > 0)?reuseIdentifier : @"UICollectionElementKindSectionFooter";
                break;
            default:
                break;
        }
    }
    return self;
}

@end

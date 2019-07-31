//
//  LVCollectionCellRegisterModel.h
//  clh
//
//  Created by 曹连华 on 2018/4/11.
//  Copyright © 2018年 曹连华. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, CVCellRegisterType) {
    RegisterTypeCVCCell,
    RegisterTypeHeader,
    RegisterTypeFooter
};

typedef NS_ENUM(NSUInteger, LoadType) {
    RegisterTypeCode,
    RegisterTypeXIB
};

@interface LVCollectionCellRegisterModel : NSObject

@property (nonatomic, assign) CVCellRegisterType registerType;
@property (nonatomic, assign) LoadType loadType;
@property (nonatomic, strong) NSString *reuseIdentifier;

- (instancetype)initWith:(NSString *)reuseIdentifier loadType:(LoadType)loadType registerType:(CVCellRegisterType)registerType;
@end

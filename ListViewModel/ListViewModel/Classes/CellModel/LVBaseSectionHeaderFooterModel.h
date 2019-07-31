//
//  LVBaseSectionHeaderFooterModel.h
//  clh
//
//  Created by 曹连华 on 2018/4/11.
//  Copyright © 2018年 曹连华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGGeometry.h>

@interface LVBaseSectionHeaderFooterModel : NSObject

@property (nonatomic, strong) NSString *headerTitle;
@property (nonatomic, strong) NSString *footerTitle;

@property (nonatomic, strong) id itemInfo;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, strong) NSString *reuseIdentifier;

- (instancetype)initWithSize:(CGSize)size itemInfo:(id)itemInfo reuseIdentifier:(NSString *)reuseIdentifier;


@end

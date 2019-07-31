//
//  TableViewDataSource.h
//  clh
//
//  Created by 曹连华 on 2018/4/11.
//  Copyright © 2018年 曹连华. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseDataSource.h"

@protocol TableViewDatawCustomDataSource <UITableViewDataSource>

@optional

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
                      rowModel:(LVBaseCellRowModel *)rowModel;

@end

@interface LVTableViewDataSource : BaseDataSource <TableViewDatawCustomDataSource>



- (instancetype)initWithDataSource:(id<TableViewDatawCustomDataSource>)dataSource;

- (void)resetDataSource:(id<TableViewDatawCustomDataSource>)dataSource;

- (void)resetSectionIndexTitles:(NSArray<NSString *>*)sectionIndexTitles;

@end

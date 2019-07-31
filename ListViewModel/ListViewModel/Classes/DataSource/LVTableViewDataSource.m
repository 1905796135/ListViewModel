//
//  TableViewDataSource.m
//  clh
//
//  Created by 曹连华 on 2018/4/11.
//  Copyright © 2018年 曹连华. All rights reserved.
//

#import "LVTableViewDataSource.h"
#import "LVBaseTableViewTVCell.h"

@interface LVTableViewDataSource ()

@property (nonatomic, weak) id <TableViewDatawCustomDataSource> tableViewDataSource;
@property (nonatomic, strong) NSArray <NSString *> *sectionIndexTitles;

@end

@implementation LVTableViewDataSource

- (instancetype)initWithDataSource:(id<TableViewDatawCustomDataSource>)dataSource {
    self = [super init];
    if (self) {
        
        self.tableViewDataSource = dataSource;
        
    }
    return self;
    
}

- (void)resetDataSource:(id<TableViewDatawCustomDataSource>)dataSource {
    self.tableViewDataSource = dataSource;
}

- (void)resetSectionIndexTitles:(NSArray<NSString *>*)sectionIndexTitles {
    if (sectionIndexTitles.count <= 0) {
        return;
    }
    self.sectionIndexTitles = [NSArray arrayWithArray:sectionIndexTitles];
}

#pragma mark - TableView - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if(self.tableViewDataSource && [self.tableViewDataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
        return [self.tableViewDataSource numberOfSectionsInTableView:tableView];
    }
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(self.tableViewDataSource && [self.tableViewDataSource respondsToSelector:@selector(tableView:numberOfRowsInSection:)]){
        return [self.tableViewDataSource tableView:tableView numberOfRowsInSection:section];
    }
    return [self sectionModelAtIndex:section].rows.count;
}

- (LVBaseTableViewTVCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LVBaseCellRowModel *rowModel = [self rowModelAtIndex:indexPath];
    
    if ([self.tableViewDataSource respondsToSelector:@selector(tableView:cellForRowAtIndexPath:rowModel:)]) {
        return (LVBaseTableViewTVCell *)[self.tableViewDataSource tableView:tableView cellForRowAtIndexPath:indexPath rowModel:rowModel];
    }
    
    LVBaseTableViewTVCell * cell = (LVBaseTableViewTVCell *)[tableView dequeueReusableCellWithIdentifier:rowModel.reuseIdentifier];
    if (cell == nil) {
        if (rowModel.loadType == TVCCellLoadXIB) {
            [tableView registerNib:[UINib nibWithNibName:rowModel.reuseIdentifier bundle:nil] forCellReuseIdentifier:rowModel.reuseIdentifier];
            cell = (LVBaseTableViewTVCell *)[rowModel createTVCCellByXIB];
            
        } else {
            cell = (LVBaseTableViewTVCell *)[rowModel createTVCCellByCode];
        }
    }
    
    [cell updateTVCCellWithRowModel:rowModel atIndexPath:indexPath];
    
    return cell;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self sectionModelAtIndex:section].sectionHeader.headerTitle;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return [self sectionModelAtIndex:section].sectionFooter.footerTitle;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    LVBaseCellRowModel *rowModel = [self rowModelAtIndex:indexPath];
    return rowModel.canEdit;
}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    LVBaseCellRowModel *rowModel = [self rowModelAtIndex:indexPath];
    return rowModel.canMove;
}

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.sectionIndexTitles;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [self.sectionIndexTitles indexOfObject:title];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    LVBaseCellRowModel *rowModel = [self rowModelAtIndex:indexPath];
    if (rowModel.editingStyle == UITableViewCellEditingStyleDelete) {//删除数据
        [self removeRowModel:rowModel];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [tableView beginUpdates];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:rowModel.editingAnimationStyle];
            [tableView endUpdates];
        });
    } else if (rowModel.editingStyle == UITableViewCellEditingStyleInsert) {//插入数据
        [self insertRowModel:rowModel atIndex:indexPath];
       
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [tableView beginUpdates];
            [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:rowModel.editingAnimationStyle];
            [tableView endUpdates];
        });
        
    }
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    LVBaseCellRowModel *sourceRow = [self rowModelAtIndex:sourceIndexPath];
    
    LVBaseCellSectionModel *sourceSectionModel = [self sectionModelAtIndex:sourceIndexPath.section];
    LVBaseCellSectionModel *destinationSectionModel = [self sectionModelAtIndex:destinationIndexPath.section];
    
    [sourceSectionModel.rows removeObjectAtIndex:sourceIndexPath.row];//先把原来位置的 rowModel 删除
    
    if (sourceIndexPath.section == destinationIndexPath.section) {//同组 移动
        [sourceSectionModel.rows insertObject:sourceRow atIndex:destinationIndexPath.row];
    } else {// 不同组移动
        [destinationSectionModel.rows insertObject:sourceRow atIndex:destinationIndexPath.row];
    
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:sourceIndexPath.section] withRowAnimation:UITableViewRowAnimationNone];
    });
    
}
@end

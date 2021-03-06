//
//  SlideEditCell.h
//  Travelbag
//
//  Created by ligh on 13-11-17.
//  Copyright (c) 2013年 partner. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SwipeEditCellDelegate;


/**
    滑动编辑Cell zuo'hua
 **/
@interface SwipeEditCell : UITableViewCell

//需要滑动的view
@property (retain,nonatomic) IBOutlet   UIView    *swipeContentView;
//向右滑动显示的view
@property (retain,nonatomic) IBOutlet   UIControl *swipeLeftEditView;
//向左滑动显示的view
@property (retain,nonatomic) IBOutlet   UIControl *swipeRightEditView;


//delegate 当点击左右editView时通知对方
@property (assign,nonatomic) IBOutlet   id<SwipeEditCellDelegate> delegate;

//如果当前处于编辑状态将cell 拉回到正常状态
-(void) pullbackSwipeContentViewAnimationd:(BOOL) animation ;
-(void) pullbackSwipeContentViewAnimationd:(BOOL) animation completion:(void (^)(void)) completion;
//将tableView 中的所有正在编辑的cell 拉回到正常正常状态
+(BOOL) pullbackCellsForTableView:(UITableView *) tableView;

-(void) enableSwipeEditOfLeft;
-(void) enableSwipeEditOfRight;


-(void) didTapLeftEditView;
-(void) didTapRightEdithView;


//*****************Static Var**********************//
+(NSMutableArray *) editingCellArray;


@end

@protocol SwipeEditCellDelegate <NSObject>


@optional
-(void) didSelectLeftEditViewOfCell:(SwipeEditCell *)  swipeEditCell;
-(void) didSelectRightEditViewOfCell:(SwipeEditCell *) swipeEditCell;

@end

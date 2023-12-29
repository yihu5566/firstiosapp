//
//  NormalTableViewCell.h
//  myfirstiosapp
//
//  Created by dongfang lu on 2023/12/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class DFListItemBean;


/// 点击删除按钮
@protocol NormaleTableViewCellDelegate <NSObject>

-(void)tabViewCell:(UITableViewCell *) tabViewCell clickDeleteButton:(UIButton *) deleteButton;

@end


/// 新闻列表cell
@interface NormalTableViewCell : UITableViewCell

@property(nonatomic,weak,readwrite)id<NormaleTableViewCellDelegate> delegate;

-(void) layoutTableViewCellWithItem:(DFListItemBean *)item;


@end

NS_ASSUME_NONNULL_END

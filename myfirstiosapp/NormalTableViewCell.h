//
//  NormalTableViewCell.h
//  myfirstiosapp
//
//  Created by dongfang lu on 2023/12/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NormaleTableViewCellDelegate <NSObject>

-(void)tabViewCell:(UITableViewCell *) tabViewCell clickDeleteButton:(UIButton *) deleteButton;

@end
@interface NormalTableViewCell : UITableViewCell

@property(nonatomic,weak,readwrite)id<NormaleTableViewCellDelegate> delegate;

-(void) layoutTableViewCell;


@end

NS_ASSUME_NONNULL_END

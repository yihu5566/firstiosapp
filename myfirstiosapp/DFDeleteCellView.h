//
//  DFDeleteCellView.h
//  myfirstiosapp
//
//  Created by dongfang lu on 2023/12/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DFDeleteCellView : UIView

- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock;

@end

NS_ASSUME_NONNULL_END

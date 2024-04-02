//
//  DFDeleteCellView.h
//  myfirstiosapp
//
//  Created by dongfang lu on 2023/12/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DFDeleteCellView : UIView

/// 点击弹出删除cell弹窗
/// - Parameters:
///   - point: 点击的位置
///   - clickBlock: 点击后的操作
- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock;

@end

NS_ASSUME_NONNULL_END

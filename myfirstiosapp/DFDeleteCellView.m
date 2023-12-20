//
//  DFDeleteCellView.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2023/12/20.
//

#import "DFDeleteCellView.h"


@interface DFDeleteCellView()

@property (nonatomic, strong, readwrite) UIView *backgroundView;
@property (nonatomic, strong, readwrite) UIButton *deleteButton;
@property (nonatomic, copy, readwrite) dispatch_block_t deleteBlock;

@end

@implementation DFDeleteCellView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _backgroundView = [[UIView alloc]initWithFrame:self.bounds];
            _backgroundView.backgroundColor = [UIColor blackColor];
            _backgroundView.alpha = 0.5;
            _backgroundView;
        })];
    }
    return self;
}



@end

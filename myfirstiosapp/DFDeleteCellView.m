//
//  DFDeleteCellView.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2023/12/20.
//

#import "DFDeleteCellView.h"
#import "GTScreen.h"


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
            [_backgroundView addGestureRecognizer: ({
                UITapGestureRecognizer *tapGesture =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDeleteView)];
                tapGesture;
            })];
            _backgroundView;
        })];
        
        [self addSubview:({
            _deleteButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
            _deleteButton.backgroundColor = [UIColor blueColor];
            [_deleteButton addTarget:self action:@selector(_clickButton) forControlEvents:UIControlEventTouchUpInside];
            [_deleteButton setTitle:@"confim delete" forState:UIControlStateNormal];
            _deleteButton.layer.cornerRadius = UI(25);
            _deleteButton;
        })];
//        self.clipsToBounds=YES;
    }
    return self;
}

-(void) dismissDeleteView{
    [self removeFromSuperview];
}

-(void) showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock{
    _deleteButton.frame = CGRectMake(point.x, point.y, 0, 0);
    _deleteBlock = [clickBlock copy];
    
    [[UIApplication sharedApplication].windows.firstObject addSubview:self] ;
   
    [UIView animateWithDuration:1.f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.deleteButton.frame = UIRect((self.bounds.size.width - 100) / 2, (self.bounds.size.height - 50) / 2, 100, 50);
        } completion:^(BOOL finished) {
            //动画结束
            NSLog(@"animate finish");
        }];
    
}
-(void) _clickButton{
    NSLog(@"click  clickButton");
    [self removeFromSuperview];
    if (_deleteBlock) {
        _deleteBlock();
    }
}

@end

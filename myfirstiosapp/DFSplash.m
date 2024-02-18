//
//  DFSplash.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2024/2/18.
//

#import "DFSplash.h"

@interface DFSplash ()

@property (nonatomic, strong, readwrite) UIButton *button;

@end

@implementation DFSplash

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        self.image = [UIImage imageNamed:@"icon.bundle/splash.png"];
        [self addSubview:({
            _button = [[UIButton alloc]initWithFrame:CGRectMake(300, 100, 60, 40)];
            _button.backgroundColor = [UIColor lightGrayColor];

            [_button setTitle:@"jump"
                     forState:UIControlStateNormal];
            [_button   addTarget:self
                          action:@selector(removeSplashView)
                forControlEvents:UIControlEventTouchUpInside];
            _button;
        })];
        self.userInteractionEnabled = YES;
    }

    return self;
}

- (void)removeSplashView {
    [self removeFromSuperview];
}

@end

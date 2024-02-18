//
//  DFVideoCoverView.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2024/1/11.
//

#import <AVFoundation/AVFoundation.h>
#import "DFVideoCoverView.h"
#import "DFVideoPlayer.h"
#import "DFVideoToolBar.h"

@interface DFVideoCoverView ()

@property (nonatomic, strong, readwrite) UIImageView *coverView;
@property (nonatomic, strong, readwrite) UIImageView *playButton;
@property (nonatomic, copy, readwrite) NSString *videoUrl;
@property (nonatomic, strong, readwrite) DFVideoToolBar *toolBar;


@end

@implementation DFVideoCoverView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        [self addSubview:({
            _coverView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,
                                                                      self.frame.size.width, self.frame.size.height - DFVideoToolbarHeight)];
            _coverView;
        })];

        [_coverView addSubview:({
            _playButton = [[UIImageView alloc]initWithFrame:CGRectMake((self.frame.size.width - UI(50)) / 2, (self.frame.size.height - DFVideoToolbarHeight - UI(50)) / 2, UI(50), UI(50))];
            _playButton;
        })];

        [_coverView addSubview:({
            _toolBar = [[DFVideoToolBar alloc]initWithFrame:CGRectMake(0, _coverView.bounds.size.height,
                                                                       _coverView.bounds.size.width, DFVideoToolbarHeight)];
            _toolBar;
        })];


        UITapGestureRecognizer *topGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_tapTopPlay)];
        [self addGestureRecognizer:topGesture];
    }

    return self;
}

#pragma public method
- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl {
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _playButton.image = [UIImage imageNamed:@"videoPlay"];
    _videoUrl = videoUrl;
    [_toolBar layoutWithModel:nil];
}

- (void)_tapTopPlay {
    NSLog(@"top");
    [[DFVideoPlayer player]playVideoWithUrl:_videoUrl attachView:_coverView];
}

@end

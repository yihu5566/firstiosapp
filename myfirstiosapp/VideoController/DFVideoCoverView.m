//
//  DFVideoCoverView.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2024/1/11.
//

#import "DFVideoCoverView.h"

@interface DFVideoCoverView ()

@property (nonatomic, strong, readwrite) UIImageView *coverView;
@property (nonatomic, strong, readwrite) UIImageView *playButton;
@property (nonatomic, copy, readwrite) NSString *videoUrl;


@end

@implementation DFVideoCoverView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        [self addSubview:({
            _coverView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
            _coverView;
        })];
        [self addSubview:({
            _playButton = [[UIImageView alloc]initWithFrame:CGRectMake((self.frame.size.width - 50) / 2, (self.frame.size.height - 50) / 2, 50, 50)];

            _playButton;
        })];


        UITapGestureRecognizer *topGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_tapTopPlay)];
        [self addGestureRecognizer:topGesture];
    }

    return self;
}

- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl {
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _playButton.image = [UIImage imageNamed:@"icon.bundle/videoPlay@3x.png"];
    _videoUrl = videoUrl;
}

- (void)_tapTopPlay {
    NSLog(@"top");
}

@end

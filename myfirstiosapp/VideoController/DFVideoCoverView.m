//
//  DFVideoCoverView.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2024/1/11.
//

#import <AVFoundation/AVFoundation.h>
#import "DFVideoCoverView.h"

@interface DFVideoCoverView ()

@property (nonatomic, strong, readwrite) AVPlayerItem *avPlayItem;
@property (nonatomic, strong, readwrite) AVPlayer *avPlayerDF;
@property (nonatomic, strong, readwrite) AVPlayerLayer *avPlayerLayer;

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

        [_coverView addSubview:({
            _playButton = [[UIImageView alloc]initWithFrame:CGRectMake((self.frame.size.width - 50) / 2, (self.frame.size.height - 50) / 2, 50, 50)];

            _playButton;
        })];


        UITapGestureRecognizer *topGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_tapTopPlay)];
        [self addGestureRecognizer:topGesture];

        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    }

    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [_avPlayItem removeObserver:self forKeyPath:@"status"];
}

#pragma public method
- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl {
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _playButton.image = [UIImage imageNamed:@"icon.bundle/videoPlay@3x.png"];
    _videoUrl = videoUrl;
}

#pragma prive method
- (void)_handlePlayEnd {
    NSLog(@"");
    [_avPlayerLayer removeFromSuperlayer];
    _avPlayItem = nil;
    _avPlayerDF = nil;
}

- (void)_tapTopPlay {
    NSLog(@"top");

    NSURL *urlVideo =   [NSURL URLWithString:_videoUrl];
    AVAsset *videoAsset =  [AVAsset assetWithURL:urlVideo];

    _avPlayItem = [AVPlayerItem playerItemWithAsset:videoAsset];
    [_avPlayItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    
    _avPlayerDF = [AVPlayer playerWithPlayerItem:_avPlayItem];
    _avPlayerLayer = [AVPlayerLayer playerLayerWithPlayer:_avPlayerDF];

    _avPlayerLayer.frame = _coverView.bounds;
    [_coverView.layer addSublayer:_avPlayerLayer];

}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"status"]) {
        if ((((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue==AVPlayerItemStatusReadyToPlay)) {
            [_avPlayerDF play];
        }else{
            NSLog(@"");
        }
    }
}

@end

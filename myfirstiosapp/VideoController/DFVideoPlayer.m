//
//  DFVideoPlayer.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2024/1/23.
//

#import <AVFoundation/AVFoundation.h>
#import "DFVideoPlayer.h"


@interface DFVideoPlayer ()

@property (nonatomic, strong, readwrite) AVPlayerItem *avPlayItem;
@property (nonatomic, strong, readwrite) AVPlayer *avPlayerDF;
@property (nonatomic, strong, readwrite) AVPlayerLayer *avPlayerLayer;

@end

@implementation DFVideoPlayer


+ (nonnull DFVideoPlayer *)player {
    static DFVideoPlayer *player;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        player = [[DFVideoPlayer alloc]init];
    });
    return player;
}

- (void)playVideoWithUrl:(nonnull NSString *)videoUrl attachView:(nonnull UIView *)attachView {
    [self _stopPlay];

    NSURL *urlVideo =   [NSURL URLWithString:videoUrl];
    AVAsset *videoAsset =  [AVAsset assetWithURL:urlVideo];

    _avPlayItem = [AVPlayerItem playerItemWithAsset:videoAsset];
    [_avPlayItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [_avPlayItem addObserver:self forKeyPath:@"LoadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];

    _avPlayerDF = [AVPlayer playerWithPlayerItem:_avPlayItem];

    [_avPlayerDF addPeriodicTimeObserverForInterval:CMTimeMake(1, 1)
                                              queue:dispatch_get_main_queue()
                                         usingBlock:^(CMTime time) {
        NSLog(@"播放进度：%@", @(CMTimeGetSeconds(time)));
    }];

    _avPlayerLayer = [AVPlayerLayer playerLayerWithPlayer:_avPlayerDF];

    _avPlayerLayer.frame = attachView.bounds;
    [attachView.layer addSublayer:_avPlayerLayer];
    // play end notification
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
}

#pragma mark - private method

- (void)_stopPlay {
    // remove listener
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [_avPlayItem removeObserver:self forKeyPath:@"status"];
    [_avPlayItem removeObserver:self forKeyPath:@"LoadedTimeRanges"];
    //destory player
    [_avPlayerLayer removeFromSuperlayer];
    _avPlayItem = nil;
    _avPlayerDF = nil;
}

- (void)_handlePlayEnd {
    NSLog(@"");

    [_avPlayerDF seekToTime:CMTimeMake(0, 1)];
    [_avPlayerDF play];
}

#pragma mark - kvo
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"status"]) {
        if ((((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerItemStatusReadyToPlay)) {
            [_avPlayerDF play];
        } else {
            NSLog(@"");
        }
    } else if ([keyPath isEqualToString:@"LoadedTimeRanges"]) {
        NSLog(@"缓冲：%@", [change objectForKey:NSKeyValueChangeNewKey]);
    }
}

@end

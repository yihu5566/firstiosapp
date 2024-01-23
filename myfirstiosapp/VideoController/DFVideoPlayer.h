//
//  DFVideoPlayer.h
//  myfirstiosapp
//
//  Created by dongfang lu on 2024/1/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/**
 播放器
 */
@interface DFVideoPlayer : NSObject
+(DFVideoPlayer*)player;

-(void) playVideoWithUrl:(NSString*) videoUrl attachView :(UIView *)attachView;

@end

NS_ASSUME_NONNULL_END

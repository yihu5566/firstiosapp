//
//  GTCommentManager.h
//  myfirstiosapp
//
//  Created by dongfang lu on 2024/4/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTCommentManager : NSObject
+(GTCommentManager *) shareManager;
-(void) showCommentView;

@end

NS_ASSUME_NONNULL_END

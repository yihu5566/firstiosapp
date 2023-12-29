//
//  DFListLoader.h
//  myfirstiosapp
//
//  Created by dongfang lu on 2023/12/26.
//

#import <Foundation/Foundation.h>

@class DFListItemBean;

NS_ASSUME_NONNULL_BEGIN

typedef void(^GTListLoaderFinishBlock)(BOOL success, NSArray<DFListItemBean *> *dataArray);

/// 列表请求loader
@interface DFListLoader : NSObject

-(void) loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END

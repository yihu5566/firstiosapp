//
//  DFListItemBean.h
//  myfirstiosapp
//
//  Created by dongfang lu on 2023/12/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//结构数据
@interface DFListItemBean : NSObject

@property(nonatomic, copy, readwrite) NSString *title;
@property(nonatomic, copy, readwrite) NSString *envelopePic;
@property(nonatomic, copy, readwrite) NSString *uniqueKey;
@property(nonatomic, copy, readwrite) NSString *chapterName;
@property(nonatomic, copy, readwrite) NSString *niceDate;
@property(nonatomic, copy, readwrite) NSString *author;
@property(nonatomic, copy, readwrite) NSString *link;

- (void)configWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END

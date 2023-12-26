//
//  DFListItemBean.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2023/12/26.
//

#import "DFListItemBean.h"

@implementation DFListItemBean

- (void)configWithDictionary:(nonnull NSDictionary *)dictionary {
    #warning 注意类型是否匹配
    self.envelopePic = [dictionary objectForKey:@"envelope_pic"];
    self.chapterName = [dictionary objectForKey:@"chapter_name"];
    self.uniqueKey = [dictionary objectForKey:@"uniquekey"];
    self.title = [dictionary objectForKey:@"title"];
    self.niceDate = [dictionary objectForKey:@"nice_date"];
    self.author = [dictionary objectForKey:@"author"];
    self.link = [dictionary objectForKey:@"link"];
}

@end

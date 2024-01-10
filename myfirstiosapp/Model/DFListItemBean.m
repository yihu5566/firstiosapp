//
//  DFListItemBean.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2023/12/26.
//

#import "DFListItemBean.h"

@implementation DFListItemBean



#pragma mark - NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.envelopePic = [coder decodeObjectForKey:@"envelopePic"];
        self.chapterName = [coder decodeObjectForKey:@"chapterName"];
        self.title = [coder decodeObjectForKey:@"title"];
        self.niceDate = [coder decodeObjectForKey:@"niceDate"];
        self.author = [coder decodeObjectForKey:@"author"];
        self.link = [coder decodeObjectForKey:@"link"];
    }

    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.envelopePic forKey:@"envelopePic"];
    [coder encodeObject:self.chapterName forKey:@"chapterName"];
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.niceDate forKey:@"niceDate"];
    [coder encodeObject:self.author forKey:@"author"];
    [coder encodeObject:self.link forKey:@"link"];
}

+ (BOOL)supportsSecureCoding {
    return YES;
}
#pragma mark - public method
- (void)configWithDictionary:(nonnull NSDictionary *)dictionary {
    #warning 注意类型是否匹配

    self.envelopePic = [dictionary objectForKey:@"envelopePic"];
    self.chapterName = [dictionary objectForKey:@"chapterName"];
    self.title = [dictionary objectForKey:@"title"];
    self.niceDate = [dictionary objectForKey:@"niceDate"];
    self.author = [dictionary objectForKey:@"author"];
    self.link = [dictionary objectForKey:@"link"];
}

@end

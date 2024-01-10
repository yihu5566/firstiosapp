//
//  DFListLoader.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2023/12/26.
//

#import <AFNetworking.h>
#import "DFListItemBean.h"
#import "DFListLoader.h"

@implementation DFListLoader

- (void)loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock {
    NSString *urlString = @"https://www.wanandroid.com/project/list/1/json?cid=294";
    NSURL *listURL = [[NSURL alloc]initWithString:urlString];
//    NSURLRequest *listRequest = [[NSURLRequest alloc]initWithURL:listURL];
    NSURLSession *session = [NSURLSession sharedSession];


    __weak typeof(self) wself = self;
    NSURLSessionTask *task =  [session dataTaskWithURL:listURL
                                     completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        __weak typeof(self) strongSelf = wself;

        NSError *jsError;

        id jsonObj = [NSJSONSerialization JSONObjectWithData:data
                                                     options:0
                                                       error:&jsError];

        NSArray *dataArray =  [((NSDictionary *)[((NSDictionary *)jsonObj)objectForKey:@"data"])objectForKey:@"datas"];

        NSMutableArray *listItemArray = @[].mutableCopy;

        for (NSDictionary *info in dataArray) {
            DFListItemBean *item = [[DFListItemBean alloc]init];
            [item configWithDictionary:info];
            [listItemArray addObject:item];
        }

        [wself _archiveListDataWithArray:listItemArray.copy];

        dispatch_async(dispatch_get_main_queue(), ^{
                           if (finishBlock) {
                               finishBlock(error == nil, listItemArray.copy);
                           }
                       });

        NSLog(@"");
    }];

    [task resume];
//    [self _getSandBoxPath];

//    AFHTTPSessionManager *manager =    [AFHTTPSessionManager manager];
//
//    [manager   GET:@"https://www.wanandroid.com/banner/json"
//        parameters:nil
//           headers:nil
//          progress:^(NSProgress *_Nonnull downloadProgress) {
//        NSLog(@"");
//    }
//           success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
//
//        NSLog(@"");
//    }
//           failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
//        NSLog(@"");
//    }];


    NSLog(@"");
}

- (void)_archiveListDataWithArray:(NSArray<DFListItemBean *> *)array {
    NSArray *pathArray =  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];

    NSFileManager *fileManager =   [NSFileManager defaultManager];

    //创建文件夹
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"DFData"];
    NSError *createError;

    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&createError];

    //创建文件
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    NSData *nsData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
    [fileManager createFileAtPath:listDataPath contents:nsData attributes:nil];

    NSDate *readListData = [fileManager contentsAtPath:listDataPath];
    
    id unarchive =  [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class], [DFListItemBean class], nil] fromData:readListData error:nil];
    
    NSLog(@"打印字符串：%@", listDataPath);
}

//- (void)_getSandBoxPath {
//    NSArray *pathArray =  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
//    NSString *cachePath = [pathArray firstObject];
//
//    NSFileManager *fileManager =   [NSFileManager defaultManager];
//
//    //创建文件夹
//    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"DFData"];
//    NSError *createError;
//
//    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&createError];
//
//    //创建文件
//    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
//    NSDate *listData =  [@"abc" dataUsingEncoding:NSUTF8StringEncoding];
//    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
//
//    //查询文件
//    BOOL fileExist =  [fileManager fileExistsAtPath:listDataPath];
//
//    if (fileExist) {
////        [fileManager removeItemAtPath:listDataPath error:nil];
//        NSLog(@"文件创建成功");
//    }
//
//    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:listDataPath];
//    [fileHandle seekToEndOfFile];
//    [fileHandle writeData:[@"def" dataUsingEncoding:NSUTF8StringEncoding]];
//
//    [fileHandle synchronizeFile];
//    [fileHandle closeFile];
//
//    NSLog(@"打印字符串：%@", listDataPath);
//}

@end

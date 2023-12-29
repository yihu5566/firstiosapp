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

-(void) loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock{
    NSString *urlString = @"https://www.wanandroid.com/project/list/1/json?cid=294";
    NSURL *listURL = [[NSURL alloc]initWithString:urlString];
//    NSURLRequest *listRequest = [[NSURLRequest alloc]initWithURL:listURL];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task =  [session dataTaskWithURL:listURL
                                     completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        NSError *jsError;

        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0  error:&jsError];
        
        NSArray *dataArray =  [((NSDictionary *)[((NSDictionary *)jsonObj)objectForKey:@"data"])objectForKey:@"datas"];

        NSMutableArray *listItemArray = @[].mutableCopy;

        for (NSDictionary *info in dataArray) {
            DFListItemBean *item = [[DFListItemBean alloc]init];
            [item configWithDictionary:info];
            [listItemArray addObject:item];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (finishBlock) {
                finishBlock(error==nil,listItemArray.copy);
            }
        });

        NSLog(@"");
    }];

    [task resume];


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

@end

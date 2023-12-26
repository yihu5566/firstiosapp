//
//  DFListLoader.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2023/12/26.
//

#import <AFNetworking.h>
#import "DFListLoader.h"

@implementation DFListLoader

- (void)loadListData {
    
    NSString *urlString = @"https://www.wanandroid.com/banner/json";
    NSURL *listURL = [[NSURL alloc]initWithString:urlString];
    NSURLRequest *listRequest = [[NSURLRequest alloc]initWithURL:listURL];

    NSURLSession *session = [NSURLSession sharedSession];

    NSURLSessionTask *task=  [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *jsError;
        
        __unused  id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsError];
        
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

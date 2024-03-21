//
//  DFMediator.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2024/3/4.
//

#import "DFMediator.h"

@implementation DFMediator

+ (__kindof UIViewController *)detailViewControllerWithUrl:(nonnull NSString *)detailUrl {
    Class details = NSClassFromString(@"NewsDetailsViewController");
    UIViewController *controller = [[details alloc]performSelector:NSSelectorFromString(@"initWithUrlString:")withObject:detailUrl];

    return controller;
}

@end

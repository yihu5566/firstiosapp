//
//  NewsDetailsViewController.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2023/12/20.
//

#import "NewsDetailsViewController.h"
#import <WebKit/WebKit.h>

@interface NewsDetailsViewController ()<WKNavigationDelegate>
@property(nonatomic,strong,readwrite) WKWebView *webView;

@end

@implementation NewsDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height-88)];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com/"]]];
    
    self.webView.navigationDelegate=self;
    
    [self.view addSubview:self.webView];
}


#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler WK_SWIFT_ASYNC(3){

    decisionHandler(WKNavigationActionPolicyAllow);
    NSLog(@"decidePolicyForNavigationAction");
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"didFinishNavigation");

}


@end

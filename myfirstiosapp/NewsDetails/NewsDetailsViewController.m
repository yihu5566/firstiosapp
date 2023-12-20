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
@property(nonatomic,strong,readwrite) UIProgressView *progressView;

@end

@implementation NewsDetailsViewController
- (void) dealloc{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:({
        self.webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height-88)];
        self.webView.navigationDelegate=self;
        self.webView;
    })];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com/"]]];

    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.view addSubview:({
        self.progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 98, self.view.frame.size.width, 20)];
        self.progressView;
    })];
    
    
}


#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler WK_SWIFT_ASYNC(3){

    decisionHandler(WKNavigationActionPolicyAllow);
//    NSLog(@"decidePolicyForNavigationAction");
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"didFinishNavigation");

}

# pragma mark - observer
- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context{
    NSLog(@"");
    self.progressView.progress = self.webView.estimatedProgress;
}



@end

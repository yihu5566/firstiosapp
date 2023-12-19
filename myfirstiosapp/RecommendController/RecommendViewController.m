//
//  RecommendViewController.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2023/12/18.
//

#import "RecommendViewController.h"

@interface RecommendViewController ()<UIScrollViewDelegate>

@end

@implementation RecommendViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/like@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/like_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.delegate=self;
    
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*5, self.view.bounds.size.height);
    
    NSArray *arrayColor = @[[UIColor redColor],[UIColor blueColor],[UIColor redColor],[UIColor yellowColor],[UIColor blueColor]];
    for (int x =0; x<5; x++) {
        [scrollView addSubview:({
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width*x,0, self.view.bounds.size.width, self.view.bounds.size.height)];
            view.backgroundColor = [arrayColor objectAtIndex:x];
            view;
        })];
    }
    
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    // Do any additional setup after loading the view.
}





#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidScroll");
}


@end

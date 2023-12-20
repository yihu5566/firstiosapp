//
//  RecommendViewController.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2023/12/18.
//

#import "RecommendViewController.h"

@interface RecommendViewController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate,UIAlertViewDelegate>{
    
    UIAlertController *_alert;
    
}

@property(retain,nonatomic) UIAlertController *alert;

@end

@implementation RecommendViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/like@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/like_selected@2x.png"];
//        填充dialog
        self.alert = [UIAlertController alertControllerWithTitle:@"title" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [self.alert addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"cancel click");
        }]];
        [self.alert addAction:[UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"sure click");
        }]];
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
            
            [view addSubview:({
                UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 0, 100, 100)];
                view.backgroundColor=[UIColor grayColor];
                UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClickListener)];
                
                tapGesture.delegate =self;
                [view addGestureRecognizer:tapGesture];
                view;
            })];
            view;
        })];
    }
    
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    // Do any additional setup after loading the view.
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    NSLog(@"gestureRecognizerShouldBegin");
    return YES;
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidScroll");
}

#pragma mark - click

- (void) tapClickListener{
    NSLog(@"tapClickListener");
    [self presentViewController:self.alert animated:YES completion:nil ];
}

@end

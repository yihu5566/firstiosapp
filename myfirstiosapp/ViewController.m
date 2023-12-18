//
//  ViewController.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2023/12/18.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIView *view1 = [[UIView alloc]init];
    view1.frame = CGRectMake(100, 100, 100, 100);
    view1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view1];
    
    UITapGestureRecognizer *tapGesture= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushController)];
    [view1 addGestureRecognizer:tapGesture];
}

-(void)pushController{
   UIViewController *viewCon= [[UIViewController alloc]init];
    viewCon.view.backgroundColor =[UIColor whiteColor];
    viewCon.navigationItem.title=@"title";
    viewCon.navigationItem.rightBarButtonItem.title=@"right title";
    [self.navigationController pushViewController:viewCon animated:YES];
}

@end

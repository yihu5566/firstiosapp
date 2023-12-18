//
//  NewsViewController.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2023/12/18.
//

#import "NewsViewController.h"

@interface NewsViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation NewsViewController

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
    
    UITableView *uiTabView = [[UITableView alloc]initWithFrame:self.view.bounds];
    uiTabView.dataSource = self;
    uiTabView.delegate = self;
    [self.view addSubview:uiTabView];

    
    
//    UIView *view1 = [[UIView alloc]init];
//    view1.frame = CGRectMake(100, 100, 100, 100);
//    view1.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:view1];
//    
//    UITapGestureRecognizer *tapGesture= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushController)];
//    [view1 addGestureRecognizer:tapGesture];
}

// pargma mark - UITableViewDeleggate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *tabViewCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    tabViewCell.textLabel.text=@"我是标题";
    tabViewCell.detailTextLabel.text=@"我是小标题";
    tabViewCell.imageView.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
    return tabViewCell;
}


//-(void)pushController{
//   UIViewController *viewCon= [[UIViewController alloc]init];
//    viewCon.view.backgroundColor =[UIColor whiteColor];
//    viewCon.navigationItem.title=@"title";
//    viewCon.navigationItem.rightBarButtonItem.title=@"right title";
//    [self.navigationController pushViewController:viewCon animated:YES];
//}

@end

//
//  NewsViewController.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2023/12/18.
//

#import "NewsViewController.h"
#import "NormalTableViewCell.h"
#import "NewsDetailsViewController.h"

@interface NewsViewController ()<UITableViewDelegate,UITableViewDataSource,NormaleTableViewCellDelegate>

@end

@implementation NewsViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsDetailsViewController *viewCon= [[NewsDetailsViewController alloc]init];
        viewCon.view.backgroundColor =[UIColor whiteColor];
        viewCon.navigationItem.title=[NSString stringWithFormat:@"我是标题-%@",@(indexPath.row)];
        [self.navigationController pushViewController:viewCon animated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NormalTableViewCell *tabViewCell=  [tableView dequeueReusableCellWithIdentifier:@"id"];
    
    if (!tabViewCell) {
        tabViewCell = [[NormalTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    tabViewCell.delegate =self;
    
    [tabViewCell layoutTableViewCell];
    
//    NSString *title= [NSString stringWithFormat:@"主题-%@", @(indexPath.row)];
//    tabViewCell.textLabel.text=title;
//    tabViewCell.detailTextLabel.text=@"我是小标题";
//    tabViewCell.imageView.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
    return tabViewCell;
}


-(void)tabViewCell:(UITableViewCell *) tabViewCell clickDeleteButton:(UIButton *) deleteButton{
    NSLog(@"click deletebutton");
    //打开全局浮窗
}


//-(void)pushController{
//   UIViewController *viewCon= [[UIViewController alloc]init];
//    viewCon.view.backgroundColor =[UIColor whiteColor];
//    viewCon.navigationItem.title=@"title";
//    viewCon.navigationItem.rightBarButtonItem.title=@"right title";
//    [self.navigationController pushViewController:viewCon animated:YES];
//}

@end

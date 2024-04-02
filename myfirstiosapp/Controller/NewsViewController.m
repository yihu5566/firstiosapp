//
//  NewsViewController.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2023/12/18.
//

#import "DFDeleteCellView.h"
#import "DFListItemBean.h"
#import "DFListLoader.h"
#import "DFMediator.h"
#import "GTScreen.h"
#import "GTSearchBar.h"
#import "NewsViewController.h"
#import "NormalTableViewCell.h"

@interface NewsViewController ()<UITableViewDelegate, UITableViewDataSource, NormaleTableViewCellDelegate>
@property (nonatomic, strong, readwrite) UITableView *uiTabView;
@property (nonatomic, strong, readwrite) NSArray *dataArray;
@property (nonatomic, strong, readwrite) DFListLoader *listLoader;


@end

@implementation NewsViewController

- (instancetype)init
{
    self = [super init];

    if (self) {
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];
        _dataArray = @[].mutableCopy;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    _uiTabView = [[UITableView alloc]initWithFrame:self.view.bounds];
    _uiTabView.dataSource = self;
    _uiTabView.delegate = self;
    [self.view addSubview:_uiTabView];

    self.listLoader = [[DFListLoader alloc]init];

    __weak typeof(self) wself = self;
    [self.listLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<DFListItemBean *> *_Nonnull dataArray) {
        __strong typeof(wself) strongSelf = wself;
        strongSelf.dataArray = dataArray;
        [strongSelf.uiTabView reloadData];
        NSLog(@"");
    }];

//    UIView *view1 = [[UIView alloc]init];
//    view1.frame = CGRectMake(100, 100, 100, 100);
//    view1.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:view1];
//
//    UITapGestureRecognizer *tapGesture= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushController)];
//    [view1 addGestureRecognizer:tapGesture];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    [self.tabBarController.navigationItem setTitleView:({
        GTSearchBar *searcherBar = [[GTSearchBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - UI(20), self.navigationController.navigationBar.bounds.size.height)];

        searcherBar;
    })];
}

// pargma mark - UITableViewDeleggate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DFListItemBean *item = [self.dataArray objectAtIndex:indexPath.row];

    __kindof UIViewController *viewCon =  [DFMediator detailViewControllerWithUrl:item.link];

    viewCon.view.backgroundColor = [UIColor whiteColor];
    viewCon.navigationItem.title = [NSString stringWithFormat:@"我是标题-%@", @(indexPath.row)];
    [self.navigationController pushViewController:viewCon animated:YES];

    NSString *stringKey = [item.id stringValue];

    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:stringKey];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NormalTableViewCell *tabViewCell =  [tableView dequeueReusableCellWithIdentifier:@"id"];

    if (!tabViewCell) {
        tabViewCell = [[NormalTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }

    tabViewCell.delegate = self;

    [tabViewCell layoutTableViewCellWithItem:[self.dataArray objectAtIndex:indexPath.row]];

//    NSString *title= [NSString stringWithFormat:@"主题-%@", @(indexPath.row)];
//    tabViewCell.textLabel.text=title;
//    tabViewCell.detailTextLabel.text=@"我是小标题";
//    tabViewCell.imageView.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
    return tabViewCell;
}

- (void)tabViewCell:(UITableViewCell *)tabViewCell clickDeleteButton:(UIButton *)deleteButton {
    NSLog(@"click deletebutton");
    //打开全局浮窗
    DFDeleteCellView *deleteView = [[DFDeleteCellView alloc]initWithFrame:self.view.bounds];
    CGRect rect = [tabViewCell convertRect:deleteButton.frame toView:nil];

    __weak typeof(self) wself = self;

//    [deleteView showDeleteViewFromPoint:rect.origin
//                             clickBlock:^{
//        NSLog(@" delete  item click");
//        __strong typeof(wself) strongSelf = wself;
//        [strongSelf.dataArray removeLastObject];
//        [strongSelf.uiTabView deleteRowsAtIndexPaths:@[[strongSelf.uiTabView indexPathForCell:tabViewCell]]
//                                    withRowAnimation:UITableViewRowAnimationAutomatic];
//    }];
}

//-(void)pushController{
//   UIViewController *viewCon= [[UIViewController alloc]init];
//    viewCon.view.backgroundColor =[UIColor whiteColor];
//    viewCon.navigationItem.title=@"title";
//    viewCon.navigationItem.rightBarButtonItem.title=@"right title";
//    [self.navigationController pushViewController:viewCon animated:YES];
//}

@end

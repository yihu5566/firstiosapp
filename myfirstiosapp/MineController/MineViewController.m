//
//  MineViewController.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2024/3/13.
//

#import <SDWebImage.h>
#import "GTLogin.h"
#import "MineViewController.h"

@interface MineViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong, readwrite) UITableView *tableView;
@property (nonatomic, strong, readwrite) UIView *tableViewHeaderView;
@property (nonatomic, strong, readwrite) UIImageView *headerImageView;

@end

@implementation MineViewController

- (instancetype)init
{
    self = [super init];

    if (self) {
        self.tabBarItem.title = @"我的";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected@2x.png"];
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:({
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds
                                               style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;

        _tableView;
    })];
}

#pragma mark -

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mineTableViewCell"];

    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mineTableViewCell"];
    }

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (!_tableViewHeaderView) {
        _tableViewHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
        _tableViewHeaderView.backgroundColor = [UIColor whiteColor];
        [_tableViewHeaderView addSubview:({
            _headerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 30,  self.view.frame.size.width, 140)];
            _headerImageView.backgroundColor = [UIColor whiteColor];
            _headerImageView.contentMode = UIViewContentModeScaleAspectFit;
            _headerImageView.clipsToBounds = YES;
            _headerImageView.userInteractionEnabled = YES;
            _headerImageView;
        })];
        [_tableViewHeaderView addGestureRecognizer:({
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                                        action:@selector(_tapImage)];
            tapGesture;
        })];
    }

    return _tableViewHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 200;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    if (![[GTLogin sharedLogin] isLogin]) {
        [_headerImageView setImage:[UIImage imageNamed:@"icon.bundle/icon.png"]];
    } else {
        [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:[GTLogin sharedLogin].avatarUrl]];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        cell.textLabel.text = [[GTLogin sharedLogin] isLogin] ? [GTLogin sharedLogin].nick : @"昵称";
    } else {
        cell.textLabel.text = [[GTLogin sharedLogin] isLogin] ? [GTLogin sharedLogin].nick : @"地区";
    }
}

#pragma mark-

- (void)_tapImage {
    
    __weak typeof(self) weakSelf = self;

    if (![[GTLogin sharedLogin]isLogin]) {
        [[GTLogin sharedLogin]loginWithFinishBlock:^(BOOL isLogin) {
        
            __strong typeof(weakSelf) strongSelf = weakSelf;

            if (isLogin) {
                [strongSelf.tableView reloadData];
            }
        }];
    } else {
        [[GTLogin sharedLogin]logOut];
        [self.tableView reloadData];
    }
}

@end

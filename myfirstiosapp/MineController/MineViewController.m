//
//  MineViewController.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2024/3/13.
//

#import "MineViewController.h"
#import "GTLogin.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong, readwrite) UITableView *tabView;
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
        _tabView = [[UITableView alloc]initWithFrame:self.view.bounds
                                               style:UITableViewStyleGrouped];
        _tabView.delegate = self;
        _tabView.dataSource = self;
       
        _tabView;
    })];
}

#pragma mark -

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return 2;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell= [tableView  dequeueReusableCellWithIdentifier:@"mineTableViewCell"];
    if (!cell) {
        cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mineTableViewCell"];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
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
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_tapImage)];
            tapGesture;
        })];
        
    }
    return _tableViewHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 200;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
//    if (!GTLogin s) {
//        <#statements#>
//    } else {
//        <#statements#>
//    }
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}


#pragma mark-

-(void) _tapImage{
    
}

@end

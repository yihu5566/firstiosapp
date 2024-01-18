//
//  VideoViewController.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2023/12/18.
//

#import "DFVideoCoverView.h"
#import "VideoViewController.h"

@interface VideoViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation VideoViewController

- (instancetype)init
{
    self = [super init];

    if (self) {
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/video_selected@2x.png"];
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    UICollectionViewFlowLayout *flowLayout =  [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.itemSize = CGSizeMake((self.view.frame.size.width - 50), (self.view.frame.size.width - 50)/16*9);


    UICollectionView *uicollection =  [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    uicollection.delegate = self;
    uicollection.dataSource = self;
    
    [uicollection registerClass:[DFVideoCoverView class] forCellWithReuseIdentifier:@"DFVideoCoverView"];

    [self.view addSubview:uicollection];
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row%3==0) {
//        return  CGSizeMake(self.view.frame.size.width, 100);;
//    }else{
//        return  CGSizeMake((self.view.frame.size.width-10)/2, 300);;
//    }
//}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DFVideoCoverView" forIndexPath:indexPath];

    if ([cell isKindOfClass:[DFVideoCoverView class]]) {
        [((DFVideoCoverView *)cell) layoutWithVideoCoverUrl:@"icon.bundle/videoCover@3x.png" videoUrl:@"http://vjs.zencdn.net/v/oceans.mp4"];
    }

    return cell;
}

@end

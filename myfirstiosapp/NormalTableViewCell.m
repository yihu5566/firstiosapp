//
//  NormalTableViewCell.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2023/12/19.
//

#import "DFListItemBean.h"
#import "NormalTableViewCell.h"
#import "SDWebImage.h"


@interface NormalTableViewCell ()

@property (nonatomic, strong, readwrite) UILabel *titleLable;
@property (nonatomic, strong, readwrite) UILabel *sourceLable;
@property (nonatomic, strong, readwrite) UILabel *commentLable;
@property (nonatomic, strong, readwrite) UILabel *timeLable;
@property (nonatomic, strong, readwrite) UIImageView *newsImageView;
@property (nonatomic, strong, readwrite) UIButton *deleteButton;


@end

@implementation NormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        [self.contentView addSubview:({
            self.titleLable = [[UILabel alloc]initWithFrame:CGRectMake(20, 15, 300, 50)];
//            self.titleLable.backgroundColor = [UIColor redColor];
            self.titleLable.font = [UIFont systemFontOfSize:16];
            self.titleLable.textColor = [UIColor blackColor];
            self.titleLable;
        })];
        [self.contentView addSubview:({
            self.sourceLable = [[UILabel alloc]initWithFrame:CGRectMake(20, 80, 50, 20)];
//             self.sourceLable.backgroundColor = [UIColor redColor];
            self.sourceLable.font = [UIFont systemFontOfSize:12];
            self.sourceLable.textColor = [UIColor blackColor];
            self.sourceLable;
        })];
        [self.contentView addSubview:({
            self.commentLable = [[UILabel alloc]initWithFrame:CGRectMake(100, 80, 50, 20)];
//            self.commentLable.backgroundColor = [UIColor redColor];
            self.commentLable.font = [UIFont systemFontOfSize:12];
            self.commentLable.textColor = [UIColor blackColor];
            self.commentLable;
        })];
        [self.contentView addSubview:({
            self.timeLable = [[UILabel alloc]initWithFrame:CGRectMake(150, 80, 50, 20)];
//            self.timeLable.backgroundColor = [UIColor grayColor];
            self.timeLable.font = [UIFont systemFontOfSize:12];
            self.timeLable.textColor = [UIColor blackColor];
            self.timeLable;
        })];
        [self.contentView addSubview:({
            self.newsImageView = [[UIImageView alloc]initWithFrame:CGRectMake(320, 20, 50, 50)];
            self.newsImageView.backgroundColor = [UIColor grayColor];
            self.newsImageView.contentMode = UIViewContentModeScaleAspectFill;
            self.newsImageView;
        })];
        [self.contentView addSubview:({
            self.deleteButton = [[UIButton alloc]initWithFrame:CGRectMake(280, 75, 40, 20)];
            self.deleteButton.backgroundColor = [UIColor blueColor];
            [self.deleteButton setTitle:@"x"
                               forState:UIControlStateNormal];
            [self.deleteButton setTitle:@"v"
                               forState:UIControlStateHighlighted];
            [self.deleteButton addTarget:self
                                  action:@selector(deleteButtonClick)
                        forControlEvents:UIControlEventTouchUpInside];
            self.deleteButton.layer.cornerRadius = 5;
            self.deleteButton.layer.masksToBounds = YES;
            self.deleteButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
            self.deleteButton.layer.borderWidth = 2;
            self.deleteButton;
        })];
    }

    return self;
}

- (void)deleteButtonClick {
//    NSLog(@"deleteButtonClick");
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabViewCell:clickDeleteButton:)]) {
        [self.delegate tabViewCell:self clickDeleteButton:self.deleteButton];
    }
}

- (void)layoutTableViewCellWithItem:(DFListItemBean *)item {
    NSString *stringKey = [item.id stringValue];

    BOOL isRead =  [[NSUserDefaults standardUserDefaults]boolForKey:stringKey];

    if (isRead) {
        self.titleLable.textColor = [UIColor grayColor];
    } else {
        self.titleLable.textColor = [UIColor blackColor];
    }

    self.titleLable.text = item.title;

    self.sourceLable.text = item.author;
    [self.sourceLable sizeToFit];

    self.commentLable.text = item.chapterName;
    [self.commentLable sizeToFit];

    self.commentLable.frame = CGRectMake(
        self.sourceLable.frame.origin.x + self.sourceLable.frame.size.width + 15,
        self.commentLable.frame.origin.y,
        self.commentLable.frame.size.width,
        self.commentLable.frame.size.height);
    self.timeLable.text = item.niceDate;

    [self.timeLable sizeToFit];

    self.timeLable.frame = CGRectMake(
        self.commentLable.frame.origin.x + self.commentLable.frame.size.width + 15,
        self.timeLable.frame.origin.y,
        self.timeLable.frame.size.width,
        self.timeLable.frame.size.height);
    
   
    [self.newsImageView sd_setImageWithURL:[NSURL URLWithString:item.envelopePic]
                                      completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                                            //处理业务逻辑，通过cacheType判断图片是否命中缓存
        NSLog(@"");
                                      }];

    // 在非主线程下载图片
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        // 下载图片的逻辑
//        NSURL *imageURL = [NSURL URLWithString:item.envelopePic];
//        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
//        UIImage *image = [UIImage imageWithData:imageData];
//        
//        // 将下载的图片传递给主线程
//        dispatch_async(dispatch_get_main_queue(), ^{
//            // 在主线程中显示图片
//            if (image) {
//                self.newsImageView.image = image;
//            } else {
//                NSLog(@"Failed to download image");
//            }
//        });
//    });
    
    
    
//    NSThread *nsThread = [[NSThread alloc] initWithBlock:^{
//        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:item.envelopePic]];
//
//        self.newsImageView.image = [UIImage imageWithData:data];
//    }];
//    nsThread.name = @"downloadThread";
//    [nsThread start];

//    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:item.envelopePic]];
//
//    self.newsImageView.image = [UIImage imageWithData:data];
}

@end

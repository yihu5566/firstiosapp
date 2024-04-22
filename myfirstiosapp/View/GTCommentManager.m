//
//  GTCommentManager.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2024/4/22.
//

#import "GTCommentManager.h"
#import "GTScreen.h"

@interface GTCommentManager ()<UITextViewDelegate>
@property (nonnull, strong, readwrite) UIView *backgroundView;
@property (nonnull, strong, readwrite) UITextView *textView;

@end

@implementation GTCommentManager

+ (GTCommentManager *)shareManager {
    static GTCommentManager *manager;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        manager = [[GTCommentManager alloc]init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];

    if (self) {
        _backgroundView = [[UIView alloc]initWithFrame:UIScreen.mainScreen.bounds];
        _backgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
        [_backgroundView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_tapBackground)]];
        [_backgroundView addSubview:({
            _textView = [[UITextView alloc]initWithFrame:CGRectMake(0, _backgroundView.frame.size.height, SCREEN_WIDTH, UI(100))];

            _textView.backgroundColor = [UIColor whiteColor];
            _textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
            _textView.layer.borderWidth = 5.f;
            _textView.delegate = self;
            _textView;
        })];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(_doTextViewAnimationWithNotification:) name:UIKeyboardWillChangeFrameNotification object:nil];
    }

    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)_tapBackground {
    [_textView resignFirstResponder];
    [_backgroundView removeFromSuperview];
}

- (void)_doTextViewAnimationWithNotification:(NSNotification *)noti {
    CGFloat duration =  [[noti.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]floatValue];
    CGRect keyboardFrame =  [[noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    NSLog(@"%d %d",SCREEN_HEIGHT,keyboardFrame.origin.y);
    
    if (keyboardFrame.origin.y > SCREEN_HEIGHT) {
        //收起
        [UIView animateWithDuration:duration
                         animations:^{
            self.textView.frame = CGRectMake(0, self.backgroundView.bounds.size.height, SCREEN_WIDTH, UI(100));
        }];
    } else {
        self.textView.frame = CGRectMake(0, self.backgroundView.bounds.size.height, SCREEN_WIDTH, UI(100));

        [UIView animateWithDuration:duration
                         animations:^{
            self.textView.frame = CGRectMake(0, self.backgroundView.bounds.size.height - keyboardFrame.size.height - UI(100), SCREEN_WIDTH, UI(100));
        }];
    }
}

- (void)showCommentView {
    [[UIApplication sharedApplication].keyWindow addSubview:_backgroundView];

    [_textView becomeFirstResponder];
}

@end

//
//  GTSearchBar.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2024/4/2.
//

#import "GTScreen.h"
#import "GTSearchBar.h"

@interface GTSearchBar ()<UITextFieldDelegate>

@property (nonatomic, strong, readwrite) UITextField *textField;

@end

@implementation GTSearchBar
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        [self addSubview:({
            _textField = [[UITextField alloc]initWithFrame:CGRectMake(UI(10), UI(7), frame.size.width - UI(10) * 2, frame.size.height - UI(7) * 2)];
            _textField.backgroundColor = [UIColor whiteColor];
            _textField.delegate = self;
            _textField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search"]
                                                    highlightedImage:[UIImage imageNamed:@"search"]];
            _textField.leftViewMode = UITextFieldViewModeAlways;
            _textField.clearButtonMode = UITextFieldViewModeAlways;
            _textField.placeholder = @"今日热点推荐";

            _textField;
        })];
    }

    return self;
}
#pragma mark delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_textField resignFirstResponder];
    return YES;
}

@end

#import <UIKit/UIKit.h>
@interface CUIButtonTitleImage :UIButton
/**
 *  图片上,标题下 按钮标题fontSize=10
 *
 *  @param image      UIImage 按钮图片
 *  @param title      NSString 按钮标题
 *  @param titleColor UIColor 标题颜色
 *  @param state      stateType：UIControlState
 */
- (void)setUpImage:(UIImage *)image withDownTitle:(NSString *)title andColor:(UIColor *)titleColor forState:(UIControlState)state;
@end

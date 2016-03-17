#import "CUIButtonTitleImage.h"
#define TITLE_FONT_SIZE        (int)17
#define IPAD_TITLE_FONT_SIZE (int)17
@implementation CUIButtonTitleImage

/**
 *  图片上,标题下 按钮标题fontSize=10
 *
 *  @param image      UIImage 按钮图片
 *  @param title      NSString 按钮标题
 *  @param titleColor UIColor 标题颜色
 *  @param state      stateType：UIControlState
 */
- (void)setUpImage:(UIImage *)image withDownTitle:(NSString *)title andColor:(UIColor *)titleColor forState:(UIControlState)state{
    self.backgroundColor = [UIColor clearColor];
    // 标题
    [self.titleLabel setContentMode:UIViewContentModeScaleToFill];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    [self setTitle:title forState:state];
    [self setImage:image forState:state];
    [self setTitleColor:titleColor forState:state];
    
    self.titleLabel.font = [UIFont systemFontOfSize:10];
    
    // 图片
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
    self.imageView.backgroundColor = [UIColor clearColor];
//    [self performSelector:@selector(resetFram1) withObject:nil afterDelay:0.001];
}
//- (void)resetFram1{
//    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    [self setImageEdgeInsets:UIEdgeInsetsMake(2,(self.frame.size.width-self.imageView.frame.size.width)/2,self.titleLabel.frame.size.height+3,0)];
//    [self setTitleEdgeInsets:UIEdgeInsetsMake(self.imageView.frame.size.height+5, -self.imageView.frame.size.width+(self.frame.size.width-self.titleLabel.frame.size.width)/2-self.imageView.frame.origin.x, 2, 0)];
//}
-(void)layoutSubviews {
    [super layoutSubviews];
    
    // Center image
    CGPoint center = self.imageView.center;
    center.x = self.frame.size.width/2;
    center.y = self.imageView.frame.size.height/2;
    self.imageView.center = center;
    
    //Center text
    CGRect newFrame = [self titleLabel].frame;
    newFrame.origin.x = 0;
    newFrame.origin.y = self.imageView.frame.size.height + 5;
    newFrame.size.width = self.frame.size.width;
    
    self.titleLabel.frame = newFrame;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}
@end

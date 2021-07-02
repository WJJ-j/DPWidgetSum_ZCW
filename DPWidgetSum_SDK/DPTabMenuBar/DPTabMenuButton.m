//
//  DPTabMenuButton.m
//  YQYLApp
//
//  Created by yupeng xia on 2021/2/19.
//  Copyright © 2021 zcw. All rights reserved.
//

#import "DPTabMenuButton.h"
#import "DPWidgetSum.h"

@interface DPTabMenuButton(){
    
}
@end

@implementation DPTabMenuButton
+ (DPTabMenuButton *)tabMenuButtonWithType:(UIButtonType)buttonType {
    DPTabMenuButton *button = [DPTabMenuButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectZero;
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.titleLabel.numberOfLines = 0;
    button.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    return button;
}
- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if (selected) {
        if (_selectFont) {
            self.titleLabel.font = _selectFont;
        }else {
            if (_font) {
                self.titleLabel.font = _font;
            }
        }
        if (_selectedColor) {
            [self setTitleColor:_selectedColor forState:UIControlStateSelected];
        }else {
            if (_normalColor) {
                [self setTitleColor:_normalColor forState:UIControlStateSelected];
            }
        }
    }else {
        if (_font) {
            self.titleLabel.font = _font;
        }
        if (_normalColor) {
            [self setTitleColor:_normalColor forState:UIControlStateNormal];
        }
    }
}
- (void)setFont:(UIFont *)btnFont {
    _font = btnFont;
    self.selected = self.selected;
}
- (void)setSelectFont:(UIFont *)btnSelectFont {
    _selectFont = btnSelectFont;
    self.selected = self.selected;
}
- (void)setNormalColor:(UIColor *)normalColor {
    _normalColor = normalColor;
    self.selected = self.selected;
}
- (void)setSelectedColor:(UIColor *)selectedColor {
    _selectedColor = selectedColor;
    self.selected = self.selected;
}
@end

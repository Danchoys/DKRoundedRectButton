//
// DKRoundedRectButton.m
// Copyright (c) 2015 Daniil Konoplev
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "DKRoundedRectButton.h"

static const CGFloat kAnimationDuration = 0.25f;
static const CGFloat kDefaultBorderWidth = 1;
static const CGFloat kDefaultCornerRadius = 5;
static const BOOL    kDefaultFillsBorders = NO;

@implementation DKRoundedRectButton

#pragma mark - Constructors

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self DKRoundedRectButton_setDefaults];
        [self DKRoundedRectButton_commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self DKRoundedRectButton_setDefaults];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self DKRoundedRectButton_commonInit];
}

- (void)DKRoundedRectButton_setDefaults {
    _cornerRadius = kDefaultCornerRadius;
    _borderWidth = kDefaultBorderWidth;
    _fillsBorders = kDefaultFillsBorders;
    _filledStateTextColor = [UIColor whiteColor];
}

- (void)DKRoundedRectButton_commonInit {
    [self updateButtonStyleAnimated:NO];
}

#pragma mark - Properties

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    [self updateButtonStyleAnimated:NO];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    [self updateButtonStyleAnimated:NO];
}

- (void)setFillsBorders:(BOOL)fillsBorders {
    _fillsBorders = fillsBorders;
    [self updateButtonStyleAnimated:NO];
}

#pragma mark - Overrides

- (void)tintColorDidChange {
    [super tintColorDidChange];
    [self updateButtonStyleAnimated:NO];
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    [self updateButtonStyleAnimated:YES];
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    [self updateButtonStyleAnimated:YES];
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    [self updateButtonStyleAnimated:YES];
}

- (void)prepareForInterfaceBuilder {
    [self DKRoundedRectButton_commonInit];
}

#pragma mark - Public API

- (void)setNeedsUpdateButtonStyle {
    [self updateButtonStyleAnimated:YES];
}

- (void)updateButtonStyleAnimated:(BOOL)animated {
    // Update the border
    self.layer.borderWidth = self.borderWidth;
    self.layer.cornerRadius = self.cornerRadius;
    // Update the background color
    if (self.state == UIControlStateNormal) {
        [UIView animateWithDuration:animated ? kAnimationDuration : 0 animations:^{
            self.backgroundColor = self.fillsBorders ? self.tintColor : [UIColor clearColor];
        }];
    } else if (self.state == UIControlStateDisabled) {
        self.backgroundColor = [UIColor clearColor];
    } else {
        self.backgroundColor = self.fillsBorders ? [UIColor clearColor] : self.tintColor;
    }
    // Set the border's color
    self.layer.borderColor = self.enabled ? self.tintColor.CGColor : [UIColor grayColor].CGColor;
    // Update the text color
    if (self.fillsBorders) {
        [self setTitleColor:self.filledStateTextColor forState:UIControlStateNormal];
        [self setTitleColor:self.tintColor forState:UIControlStateHighlighted];
        [self setTitleColor:self.tintColor forState:UIControlStateSelected];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    } else {
        [self setTitleColor:self.tintColor forState:UIControlStateNormal];
        [self setTitleColor:self.filledStateTextColor forState:UIControlStateHighlighted];
        [self setTitleColor:self.filledStateTextColor forState:UIControlStateSelected];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    }
    [self setTitleShadowColor:[UIColor clearColor] forState:UIControlStateNormal];
}

@end

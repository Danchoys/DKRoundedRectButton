//
// DKRoundedRectButton.h
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

#import <UIKit/UIKit.h>

/// A button that mimics the behavior of the buy button found in the AppStore app.
/// This class may be subclassed to add additional styling. When using this class
/// from the interface builder, set the `type` selector to `Custom`.
IB_DESIGNABLE @interface DKRoundedRectButton : UIButton

/// The button's corner radius.
/// Defaults to 5.0.
@property (nonatomic) IBInspectable CGFloat cornerRadius;

/// The button's border's width.
/// Defaults to 1.0.
@property (nonatomic) IBInspectable CGFloat borderWidth;

/// The color of the button's text, when it is in such a
/// state, that the borders are filled with the tint color.
/// Defaults to [UIColor whiteColor].
@property (nonatomic) IBInspectable UIColor *filledStateTextColor;

/// Defines whether the button should fill its borders
/// with the tint color in the `UIControlStateNormal` state.
@property (nonatomic) IBInspectable BOOL fillsBorders;

/// Forces the button's style update.
- (void)setNeedsUpdateButtonStyle;

/// This is a customization point. Override in a subclass
/// to add additional styling to the button.
- (void)updateButtonStyleAnimated:(BOOL)animated;

@end
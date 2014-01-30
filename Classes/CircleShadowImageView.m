//
//  CircleShadowImageView.m
//  CircleShadowImageView
//
//  Created by Josh Holtz on 1/30/14.
//  Copyright (c) 2014 Josh Holtz. All rights reserved.
//

#import "CircleShadowImageView.h"

#import <QuartzCore/QuartzCore.h>

#pragma mark - ShadowView - Interface

@interface ShadowView : UIView

- (void)setShadow:(UIColor*)shadowColor shadowOffset:(CGSize)offset shadowOpacity:(CGFloat)opacity shadowRadius:(CGFloat)radius;

@end

#pragma mark - ShadowImageView - Interface

@interface CircleShadowImageView()

@property (nonatomic, strong) UIImageView *subImageView;
@property (nonatomic, strong) ShadowView *subShadowView;

@end

#pragma mark - CircleShadowImageView - Implementation

@implementation CircleShadowImageView

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithImage:(UIImage *)image {
    self = [self initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    if (self) {
        [self setImage:image];
    }
    return self;
}

- (id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage {
    self = [self initWithImage:image];
    if (self) {
        [_subImageView setHighlightedImage:highlightedImage];
    }
    return self;
}

// Common setup for inits
- (void)setup {
    if (_subImageView == nil) {
        _subImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
        [self addSubview:_subImageView];
    }
    
    if (_subShadowView == nil) {
        _subShadowView = [[ShadowView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
        [self insertSubview:_subShadowView atIndex:0];
    }
    
    [self setImage:self.image];
}

// Delegates setImage: to subImageView
- (void)setImage:(UIImage *)image {
    [_subImageView setImage:image];
    
    [_subImageView.layer setCornerRadius:CGRectGetWidth(self.frame)/2.0f];
    [_subImageView.layer setMasksToBounds:YES];
    
    [super setImage:nil];
}

// Delegates setHighlighted: to subImageView
- (void)setHighlighted:(BOOL)highlighted {
    [_subImageView setHighlighted:YES];
}

// Delegates isHighlighted to subImageView
- (BOOL)isHighlighted {
    return _subImageView.isHighlighted;
}

// Delegates highlightedImage to subImageView
- (UIImage *)highlightedImage {
    return _subImageView.highlightedImage;
}

// Delegates setShadow to subShadowView
- (void)setShadow:(UIColor*)shadowColor shadowOffset:(CGSize)offset shadowOpacity:(CGFloat)opacity shadowRadius:(CGFloat)radius {
    [_subShadowView setShadow:shadowColor shadowOffset:offset shadowOpacity:opacity shadowRadius:radius];
}

@end

#pragma mark - ShadowView - Implementation

@implementation ShadowView

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    [self setBackgroundColor:[UIColor clearColor]];
    [self setShadow:[UIColor darkGrayColor] shadowOffset:CGSizeMake(2.0f, 2.0f) shadowOpacity:0.8f shadowRadius:3.0f];
}

- (void)setShadow:(UIColor*)shadowColor shadowOffset:(CGSize)offset shadowOpacity:(CGFloat)opacity shadowRadius:(CGFloat)radius {
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowRadius = radius;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:( CGRectGetWidth(self.frame)/2.0f )];
    CGContextAddPath(context, path.CGPath);
    CGContextFillPath(context);
}

@end
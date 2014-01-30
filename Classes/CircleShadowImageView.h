//
//  CircleShadowImageView.h
//  CircleShadowImageView
//
//  Created by Josh Holtz on 1/30/14.
//  Copyright (c) 2014 Josh Holtz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleShadowImageView : UIImageView

- (void)setShadow:(UIColor*)shadowColor shadowOffset:(CGSize)offset shadowOpacity:(CGFloat)opacity shadowRadius:(CGFloat)radius;

@end

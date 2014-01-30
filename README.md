CircleShadowImageView
=====================

iOS UIImageView subclass for making a circle image with a shadow

![Screenshot](https://raw.github.com/joshdholtz/CircleShadowImageView/master/Screenshots/screenshot.png)

## Eamples - Interface Builder

![InterfaceBuilder](https://raw.github.com/joshdholtz/CircleShadowImageView/master/Screenshots/example_ib.png)

## Examples - Code

````objc
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Create with coooddeeezzzzzzz
    _circleChadowImageView = [[CircleShadowImageView alloc] initWithFrame:CGRectMake(40.0f, 150.0f, 220.0f, 220.0f)];
    [_circleChadowImageView setImage:[UIImage imageNamed:@"bandit-square"]];
    [_circleChadowImageView setShadow:[UIColor colorWithRed:0.1f green:0.2f blue:0.4f alpha:1.0f]
                         shadowOffset:CGSizeMake(7.0f, 7.0f)
                        shadowOpacity:0.8f
                         shadowRadius:15.0f];
    [self.view addSubview:_circleChadowImageView];
    
    // OR could init with image
//    _circleChadowImageView = [[CircleShadowImageView alloc] initWithImage:[UIImage imageNamed:@"bandit-square"] highlightedImage:[UIImage imageNamed:@"josh-square"]];

}

````

## Installation

### Drop-in Classes
Clone the repository and drop in the .h and .m files from the "Classes" directory into your project.

### CocoaPods
CircleShadowImageView is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod 'CircleShadowImageView', :git => 'git@github.com:joshdholtz/CircleShadowImageView.git'

## Author

Josh Holtz, me@joshholtz.com, [@joshdholtz](https://twitter.com/joshdholtz)

## License

CircleShadowImageView is available under the MIT license. See the LICENSE file for more info.

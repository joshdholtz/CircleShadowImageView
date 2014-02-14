CircleShadowImageView
=====================

UITextView category to add autocomplete options in a UITableView

## Features

- Add too a textfield with just a category - NO SUBCLASSING SON!!
- Two different styles to choose from
    - Dropdown from textfield
    - Input accessory above keyboard
- Set height of autocomplete table
- Select default single line cell or define custom autocomplete cell

## Demo - Dropdown style

![Screenshot](https://raw.github.com/joshdholtz/JHAutoCompleteTextView/master/Demo/autocomplete-movie-1.gif)

## Demo - Input accessory style

![Screenshot](https://raw.github.com/joshdholtz/JHAutoCompleteTextView/master/Demo/autocomplete-movie-2.gif)

##

## Examples - Code

````objc

- (void)viewDidLoad
{
    [super viewDidLoad];

    // BOOM, this	
    [_txtSearch setAutocompleteWithDataSource:self delegate:self];

}

#pragma mark - JHAutoCompleteDataSource

- (void)autocomplete:(JHAutoCompleteView *)autocompleteView withQuery:(NSString *)query withBlock:(JHAutoCompleteResultsBlock)resultsBlock {

    if (resultsBlock != nil) {

        // Performs filtering in background - could easily be an async network call
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
            
            // Filtering
            NSMutableArray *array = [self sampleData].mutableCopy;
            [array filterUsingPredicate:[NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] %@", query]];
            
            // Returning results on main queue
            dispatch_async(dispatch_get_main_queue(), ^{
                resultsBlock(array);
            });
        });
    }
}

#pragma mark - JHAutoCompleteDelegate

// Height of autocomplete result row in table
- (CGFloat)autocomplete:(JHAutoCompleteView *)autocomplete heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 35.0f;
}

// Height of entire autocomplete result table
- (CGFloat)autocompleteHeight {
    return 100.0f;
}

// NO for dropdown, YES for input acessory
- (BOOL)autocompleteHasKeyboardAccessory:(JHAutoCompleteView *)autocomplteView {
    return NO;
}

// This is what happens when a user selects a result - do what you want
- (void)autocomplete:(JHAutoCompleteView *)autocompleteView selectedObject:(id)object atIndex:(NSInteger)index {
    [_txtSearch setText:object];
}

````

## Installation

### Drop-in Classes
Clone the repository and drop in the .h and .m files from the "Classes" directory into your project.

### CocoaPods
JHAutoCompleteTextView is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod 'JHAutoCompleteTextView', :git => 'git@github.com:joshdholtz/JHAutoCompleteTextView.git'

## Author

Josh Holtz, me@joshholtz.com, [@joshdholtz](https://twitter.com/joshdholtz)

## License

JHAutoCompleteTextView is available under the MIT license. See the LICENSE file for more info.

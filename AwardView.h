#import <AppKit/NSView.h>

@class NSTextField;
@class NSBitmapImageRep;

@interface AwardView:NSView {
    NSTextField *nameField;
    NSInteger numLevels;
    NSInteger score;
    CGFloat textDrawingLocation;
}

+ (void)makeNewAwardForLevels:(NSInteger)nLevels score:(NSInteger)sc;
- (BOOL)getUserName;

@end


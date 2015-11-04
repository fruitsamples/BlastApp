#import <AppKit/AppKit.h>
#import "Game.h"

@interface InputIndicator:NSView {
    BOOL highlighted[NumCommands];
}

- (void)turnOn:(NSInteger)cmd;
- (void)turnOff:(NSInteger)cmd;

@end


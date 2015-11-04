

#import "Gate.h"

@implementation Gate
- (void)setEnabled:(BOOL)flag {
    curPose = flag ? 1 : 0;
}

- (BOOL)isEnabled {
    return (curPose == 1) ? YES : NO;
}

- (BOOL)isClosed {
    return ![self isEnabled];
}

- (void)explode {
}
@end

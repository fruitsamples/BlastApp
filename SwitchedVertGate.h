

#import "VertGate.h"

@interface SwitchedVertGate:VertGate {
     NSInteger nextChangeTime;
}

- (void)openGate;
- (void)closeGate;

@end


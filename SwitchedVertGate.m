#import "SwitchedVertGate.h"
#import "Game.h"

@implementation SwitchedVertGate
- (void)updatePiece {
    [super updatePiece];
    if ([game updateTime] > nextChangeTime) {
        [self setEnabled:![self isEnabled]];
        nextChangeTime = [game updateTime] + TIMETOCHANGESWITCHEDGATE;
    }
}

- (void)openGate {
    [self setEnabled:YES];
    nextChangeTime = [game updateTime] + TIMETOCLOSESWITCHEDGATE;
}

- (void)closeGate {
    [self setEnabled:NO];
    nextChangeTime = [game updateTime] + TIMETOCHANGESWITCHEDGATE;
}
@end

#import "TimedVertGate.h"
#import "Game.h"

@implementation TimedVertGate
- (void)updatePiece {
    [super updatePiece];
    if ([game updateTime] > nextChangeTime) {
        [self setEnabled:![self isEnabled]];
        nextChangeTime = [game updateTime] + TIMETOCHANGEGATE - 30 + [Game randInt:60];
    }
}
@end

#import "TimedHorizGate.h"
#import "Game.h"

@implementation TimedHorizGate
- (void)updatePiece {
    [super updatePiece];

    if ([game updateTime] > nextChangeTime) {
        [self setEnabled:![self isEnabled]];
        nextChangeTime = [game updateTime] + TIMETOCHANGEGATE - 50 + [Game randInt:100];
    }
}
@end

#import "PassableVertGate.h"
#import "Game.h"

@implementation PassableVertGate
- (void)updatePiece {
    [super updatePiece];

    if ([game helicopter] != nil && [[game helicopter] touchesRect:pos]) {
        [self setEnabled:YES];
        nextChangeTime = [game updateTime] + TIMETOOPENGATE;
    } else if ([game updateTime] > nextChangeTime) {
        [self setEnabled:![self isEnabled]];
        nextChangeTime = [game updateTime] + ([self isEnabled] ? TIMETOCLOSEGATE : TIMETOOPENGATE);
    }
}
@end

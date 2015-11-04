#import "RandomMine.h"
#import "Game.h"

@implementation RandomMine
- (void)explode {
    [self setVelocity:NSMakeSize(0.0, MAXVELY * (15 * [Game randInt:6]) / 100)];
}
@end

#import "RapidFireDropShip.h"
#import "Game.h"

@implementation RapidFireDropShip
- (void)updatePiece {
    BOOL canFire = NO;

    if ([game helicopter] == nil) {
        rapidFire = 0;
    } else if ([game updateTime] > nextFireTime) {
        canFire = YES;
    }

    [super updatePiece];

    if (canFire && (nextFireTime > [game updateTime])) {	// Did indeed fire!
        if (--rapidFire > 0) {
            nextFireTime = [game updateTime] + TIMETORECHARGERAPIDENEMYBULLET;
        } else {
            rapidFire = 2 + ([Game randInt:1] == 0 ? (([Game randInt:4] == 0) ? 8 : 3) : [Game randInt:4]);
        }
    }
}
@end

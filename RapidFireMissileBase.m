#import "RapidFireMissileBase.h"
#import "Game.h"

@implementation RapidFireMissileBase
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
            rapidFire = 4 + [Game randInt:6];
        }
    }
}
@end

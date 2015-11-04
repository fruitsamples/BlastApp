#import "HangingBase.h"
#import "HangingBaseExplosion.h"
#import "EnemyBullet.h"
#import "Helicopter.h"
#import "Game.h"

@implementation HangingBase
- (void)explode {
    id exp = [[HangingBaseExplosion alloc] initInGame:game];
    [game addScore:HANGINGBASESCORE];
    [self explode:exp];
}

- (CGFloat)detectDistance {
    return HANGINGBASEDISTANCE;
}

- (void)updatePiece {
    Helicopter *helicopter = [game helicopter];
    if (helicopter != nil) {
	NSRect helicopterRect = [helicopter rect];
        if ([self isInFrontAndWithin:[self detectDistance] ofPiece:helicopter] && (curImage == 2 || (NSMaxY(helicopterRect) >= pos.origin.y && curImage == 0)) && [game updateTime] > nextFireTime) {
            GamePiece *missile = [[EnemyBullet alloc] initInGame:game];
            [missile setVelocity:NSMakeSize(-BULLETVEL, curImage < 2 ? 0.0 : -BULLETVEL/4.0)];
            [missile setLocation:NSMakePoint(pos.origin.x, pos.origin.y + 2.0)];
            [game addGamePiece:missile];
            [game playEnemyFireSound];
            nextFireTime = [game updateTime] + TIMETORECHARGEENEMYBULLET;
        }
    }
    [super updatePiece];
}
@end

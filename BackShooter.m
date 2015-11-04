#import "BackShooter.h"
#import "BackShooterExplosion.h"
#import "Helicopter.h"
#import "EnemyBullet.h"
#import "Game.h"

@implementation BackShooter
- (NSInteger)pieceType {
    return StationaryEnemyPiece;
}

- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"backshooter" numFrames:4])) return nil;
    [self setPerFrameTime:300 + 5 * [Game randInt:20]];
    return self;
}

- (BOOL)touches:(GamePiece *)obj {
    return NO;
}

- (void)explode {
    id exp = [[BackShooterExplosion alloc] initInGame:game];
    [game addScore:BACKSHOOTERSCORE];
    [self explode:exp];
}

- (void)updatePiece {
    Helicopter *helicopter = [game helicopter];
    if (helicopter != nil) {
        NSRect helicopterRect = [helicopter rect];

        if ([self isInBackAndWithin:BACKSHOOTERDISTANCE ofPiece:helicopter] && (helicopterRect.origin.y <= NSMaxY(pos) && curImage == 2) || (helicopterRect.origin.y >= NSMaxY(pos) && curImage == 0) && [game updateTime] > nextFireTime) {
            GamePiece *missile = [[EnemyBullet alloc] initInGame:game];
            [missile setVelocity:NSMakeSize(BULLETVEL, (curImage == 0) ? BULLETVEL/3.0 : 0.0)];
            [missile setLocation:NSMakePoint(NSMaxX(pos), pos.origin.y + (curImage == 0 ? 7.0 : 4.0))];
            [game addGamePiece:missile];
            [game playEnemyFireSound];
            nextFireTime = [game updateTime] + TIMETORECHARGEENEMYBULLET;
        }
    }
    [super updatePiece];
}
@end

#import "MissileBase.h"
#import "MissileBaseExplosion.h"
#import "Missile.h"
#import "Helicopter.h"
#import "Game.h"

@implementation MissileBase
- (NSInteger)pieceType {
    return StationaryEnemyPiece;
}

- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"mbase" numFrames:3])) return nil;
    [self setPerFrameTime:300 + 50 * [Game randInt:20]];
    return self;
}

- (void)explode {
    id exp = [[MissileBaseExplosion alloc] initInGame:game];
    [game addScore:MISSILEBASESCORE];
    [self explode:exp];
}

- (void)updatePiece {
    if ([self isWithin:MISSILEDISTANCE ofPiece:[game helicopter]] && curImage == 0 && [game updateTime] > nextFireTime) {
        GamePiece *missile = [[Missile alloc] initInGame:game];
        NSPoint bulletLocation = NSMakePoint(NSMidX(pos) - [missile size].width/2.0, NSMaxY(pos) - 6.0);
        NSSize bulletVelocity = NSMakeSize(vel.width, vel.height + BULLETVEL);
        [missile setLocation:bulletLocation];
        [missile setVelocity:bulletVelocity];
        [game addGamePiece:missile];
        [game playEnemyFireSound];
        nextFireTime = [game updateTime] + TIMETORECHARGEMISSILE;
    }
    [super updatePiece];
}
@end


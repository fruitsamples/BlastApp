#import "SmartMissileBase.h"
#import "SmartMissileBaseExplosion.h"
#import "SmartMissile.h"
#import "Helicopter.h"
#import "Game.h"

@implementation SmartMissileBase
- (NSInteger)pieceType {
    return StationaryEnemyPiece;
}

- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"smartmbase" numFrames:3])) return nil;
    [self setPerFrameTime:600];
    return self;
}

- (BOOL)touches:(GamePiece *)obj {
    return NO;
}

- (void)explode {
    id exp = [[SmartMissileBaseExplosion alloc] initInGame:game];
    [game addScore:MISSILEBASESCORE];
    [self explode:exp];
}

- (void)updatePiece {
    if ([self isWithin:SMARTMISSILEDISTANCE ofPiece:[game helicopter]] && curImage == 0 && [game updateTime] > nextFireTime) {
        GamePiece *missile = [[SmartMissile alloc] initInGame:game];
        NSPoint bulletLocation = NSMakePoint(NSMidX(pos) - 3.0, NSMaxY(pos));
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

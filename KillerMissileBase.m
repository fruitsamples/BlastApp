#import "KillerMissileBase.h"
#import "KillerMissile.h"
#import "SmartMissileBaseExplosion.h"
#import "Helicopter.h"
#import "Game.h"

@implementation KillerMissileBase
- (NSInteger)pieceType {
    return StationaryEnemyPiece;
}

- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"smartmbase" numFrames:3])) return nil;
    [self setPerFrameTime:200];
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
    if ([self isWithin:KILLERMISSILEDISTANCE ofPiece:[game helicopter]] && [game updateTime] > nextFireTime) {
        GamePiece *missile = [[KillerMissile alloc] initInGame:game];
        [missile setLocation:NSMakePoint(NSMidX(pos) - 3.0, NSMaxY(pos))];
        [game addGamePiece:missile];
        [game playEnemyFireSound];
        nextFireTime = [game updateTime] + TIMETORECHARGEKILLERMISSILE;
    }
    [super updatePiece];
}
@end

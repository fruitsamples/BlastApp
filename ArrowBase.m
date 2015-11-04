#import "ArrowBase.h"
#import "ArrowBaseExplosion.h"
#import "Arrow.h"
#import "Helicopter.h"
#import "Game.h"

@implementation ArrowBase
- (NSInteger)pieceType {
    return StationaryEnemyPiece;
}

- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"arrowbase" numFrames:1])) return nil;
    [self setPerFrameTime:100000000];
    return self;
}

- (void)explode {
    id exp = [[ArrowBaseExplosion alloc] initInGame:game];
    [game addScore:ARROWBASESCORE];
    [self explode:exp];
}

- (void)updatePiece {
    Helicopter *helicopter = [game helicopter];
    if (helicopter != nil && [self isInFrontAndWithin:ARROWDISTANCE ofPiece:helicopter] && [game updateTime] > nextFireTime) {
        id arrow = [[Arrow alloc] initInGame:game];
        [arrow setVelocity:NSMakeSize(-ARROWVEL, 0.0)];
        [arrow setLocation:NSMakePoint(pos.origin.x - 7.0, pos.origin.y + 11.0)];
        [game addGamePiece:arrow];
        [game playEnemyFireSound];
        nextFireTime = [game updateTime] + TIMETORECHARGEARROW;
    }
    [super updatePiece];
}
@end

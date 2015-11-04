#import "KillerWave.h"
#import "EnemyBullet.h"
#import "Game.h"

@implementation KillerWave
- (NSInteger)pieceType {
    return MobileEnemyPiece;
}

- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"wave" numFrames:3])) return nil;
    [self setVelocity:NSMakeSize(-MAXVELX, 0.0)];
    [self setPerFrameTime:100];
    [self setTimeToExpire:5000];
    return self;
}

- (void)explode {
    NSInteger cnt;
    for (cnt = -1; cnt <= 1; cnt += 2) {
        GamePiece *missile = [[EnemyBullet alloc] initInGame:game];
        [missile setVelocity:NSMakeSize(vel.width, vel.height + (cnt * MAXVELY / 3.0))];
        [missile setLocation:pos.origin];
        [game addGamePiece:missile];
    }
    [game addScore:ATTACKSHIPSCORE];
    [self explode:nil];
}
@end


#import "Spider.h"
#import "EnemyBullet.h"
#import "Helicopter.h"
#import "Game.h"

@implementation Spider
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"spider" numFrames:3 numPoses:2])) return nil;
    [self setPerFrameTime:300];
    return self;
}

- (NSInteger)pieceType {
    return StationaryEnemyPiece;
}

- (void)frameChanged {
    if (curImage == 0) {
        Helicopter *helicopter = [game helicopter];
        if (helicopter != nil && [self isWithin:SPIDERDISTANCE ofPiece:helicopter]) {
            NSRect hRect = [helicopter rect];
            [self setVelocity:NSMakeSize(((NSMidX(hRect) < pos.origin.x) ? -abs(vel.width) : abs(vel.width)), vel.height)];
        }
    }
}

enum {
    POINTINGLEFT = 1,
    POINTINGRIGHT = 0
};

- (void)setVelocity:(NSSize)newVelocity {
    [super setVelocity:newVelocity];
    if (vel.width < 0) {
        curPose = POINTINGLEFT;
    } else {
        curPose = POINTINGRIGHT;
    }
}

- (NSInteger)rechargeTime {
    return TIMETORECHARGESPIDER;
}

- (void)updatePiece {
    if ([game updateTime] > stunnedUntil) {
        [super updatePiece];

        if (curImage != 0 && [game updateTime] > nextFireTime) {
            Helicopter *helicopter = [game helicopter];
            if (helicopter!= nil && [self isWithin:SPIDERDISTANCE ofPiece:helicopter]) {
                [self fireBullet:[[EnemyBullet alloc] init] speed:BULLETVEL towardsPiece:helicopter smart:YES from:NSZeroPoint];
                nextFireTime = [game updateTime] + [self rechargeTime];
            }
        }
    }
}

- (void)explode {
    if ([game updateTime] < stunnedUntil || ++nHits == REQUIREDSPIDERHITS) {
        nHits = 0;
        stunnedUntil = [game updateTime] + TIMETOUNSTUNSPIDER;
    }
}
@end


	
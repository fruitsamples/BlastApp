#import "Wave.h"
#import "Game.h"

@implementation Wave
- (NSInteger)pieceType {
    return MobileEnemyPiece;
}

- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"wave" numFrames:3])) return nil;
    [self setVelocity:NSMakeSize(-MAXVELX, 0.0)];
    [self setPerFrameTime:100];
    [self setTimeToExpire:6000];
    return self;
}

- (void)explode {
    if (++nHits == REQUIREDWAVEHITS) {
        [game addScore:ATTACKSHIPSCORE];
        [super explode];
    }
}

// This makes all of the Wave instances disappear when the helicopter goes away. Cheezy.
- (void)updatePiece {
    if ([game helicopter] == nil) {
        [super explode];
    } else {
        [super updatePiece];
    }
}
@end

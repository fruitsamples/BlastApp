#import "SneakyBoingBall.h"
#import "Helicopter.h"
#import "Game.h"

@implementation SneakyBoingBall
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"greenboing" numFrames:1])) return nil;
    [self setPerFrameTime:100000000];
    return self;
}

- (void)updatePiece {
    Helicopter *helicopter = [game helicopter];

    if (helicopter != nil && acc.height >= 0.0 && [self isInFrontAndWithin:3.0 ofPiece:helicopter]) {
        [self setAcceleration:NSMakeSize(0, -25)];
        [self setVelocity:NSMakeSize(0, -MAXVELX / 3.0)];
    }
    [super updatePiece];
}

- (void)explode {
}
@end

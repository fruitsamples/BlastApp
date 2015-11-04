#import "KillerMissile.h"
#import "Helicopter.h"
#import "Game.h"

@implementation KillerMissile
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"smartmissile" numFrames:1])) return nil;
    [self setPerFrameTime:TIMETOADJUSTKILLERMISSILE];
    [self setTimeToExpire:10000];
    [self setVelocity:NSMakeSize(0.0, MAXVELY / 3.0)];
    return self;
}

- (void)frameChanged {
    if (curImage == numImages - 1) {
        Helicopter *helicopter = [game helicopter];
        if (helicopter != nil) {
            [self setVelocity:NSMakeSize(MAXVELX, MAXVELY / 2.0)];
            [self flyTowardsPiece:helicopter smart:YES];
        }
        [self setPerFrameTime:100000000];
    }
}

- (void)updatePiece {
    if ([game helicopter] == nil) {
        [self explode];
    } else {
        [super updatePiece];
    }
}
@end

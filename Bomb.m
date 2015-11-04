#import "Bomb.h"
#import "SmallHarmlessExplosion.h"
#import "Helicopter.h"
#import "Game.h"

@implementation Bomb
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"bomb" numFrames:6])) return nil;
    [self setPerFrameTime:250];
    [self setTimeToExpire:8000];
    return self;
}

- (void)frameChanged {
    if (curImage == numImages - 1) {
        Helicopter *helicopter = [game helicopter];
        if (helicopter != nil) {
            NSRect hRect = [helicopter rect];
            NSSize backgroundSize = [[game background] size];
            [self setVelocity:NSMakeSize(MAXVELX, MAXVELY * hRect.origin.x / (backgroundSize.width * 2.0))];
            [self flyTowardsPiece:helicopter smart:YES];
        }
        [self setPerFrameTime:100000000];
    }
}

- (void)updatePiece {
    if ([game helicopter] == nil) {
	[self explode:nil];
    } else {
	[super updatePiece];
    }
}

- (void)explode {
    id exp = [[SmallHarmlessExplosion alloc] initInGame:game];
    [game addScore:BOMBSCORE];
    [super explode:exp];
}
@end

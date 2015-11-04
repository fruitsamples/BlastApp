#import "Gunes.h"
#import "BigExplosion.h"
#import "Game.h"

@implementation Gunes
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"gunes" numFrames:8])) return nil;
    [self setPerFrameTime:150];
    return self;
}

- (void)explode {
}

- (BOOL)touches:(GamePiece *)obj {
    return NO;
}

- (BOOL)touchesRect:(NSRect)rect {
    return NO;
}

- (void)updatePiece {
    Helicopter *helicopter = [game helicopter];

    if (helicopter != nil && [GamePiece intersectsRects:[helicopter rect] :pos]) {
        NSSize hVel = [helicopter velocity];
        NSSize hAcc = [helicopter acceleration];
        if (abs(hAcc.height) > 1.0 || abs(hAcc.width) > 1.0 || abs(hVel.height) > 1.0 || abs(hVel.width) > MAXVELX / 3.0) {
            id exp = [[BigExplosion alloc] initInGame:game];
            [self explode:exp];
            return;
        }
    }
    [super updatePiece];
}
@end

#import "FourMines.h"
#import "BigExplosion.h"
#import "Game.h"

@implementation FourMines
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"fourmines" numFrames:10])) return nil;
    [self setPerFrameTime:200];
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

    if ((curImage == 0) && helicopter != nil && [GamePiece intersectsRects:[helicopter rect] :pos]) {
        id exp = [[BigExplosion alloc] initInGame:game];
        [self explode:exp];
    } else {
        [super updatePiece];
    }
}
@end

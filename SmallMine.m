#import "SmallMine.h"
#import "SmallMineExplosion.h"
#import "Game.h"

@implementation SmallMine
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"smallmine" numFrames:1])) return nil;
    [self setPerFrameTime:100000000];
    return self;
}

- (void)explode {
    id exp = [[SmallMineExplosion alloc] initInGame:game];
    [game addScore:MINESCORE];
    [self explode:exp];
}
@end

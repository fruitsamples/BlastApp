#import "DumHangingBase.h"
#import "Game.h"

@implementation DumHangingBase
- (NSInteger)pieceType {
    return StationaryEnemyPiece;
}

- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"hbase" numFrames:4])) return nil;
    [self setPerFrameTime:500 + 20 * [Game randInt:10]];
    return self;
}

- (void)explode {
}
@end

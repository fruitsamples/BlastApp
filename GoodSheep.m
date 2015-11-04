#import "GoodSheep.h"
#import "Game.h"

@implementation GoodSheep
- (NSInteger)pieceType {
    return StationaryEnemyPiece;
}

- (void)explode {
    [game addScore:GOODSHEEPSCORE];
    [self explode:nil];
}
@end



#import "SmallMineExplosion.h"

@implementation SmallMineExplosion
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"smallmineexplosion" numFrames:4])) return nil;
    [self setPerFrameTime:200];
    [self setTimeToExpire:800];
    return self;
}

- (void)explode:(GamePiece *)explosion {
}
@end

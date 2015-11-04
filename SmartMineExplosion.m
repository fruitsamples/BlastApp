

#import "SmartMineExplosion.h"

@implementation SmartMineExplosion
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"smartmineexplosion" numFrames:4])) return nil;
    [self setPerFrameTime:200];
    [self setTimeToExpire:800];
    return self;
}

- (void)explode:(GamePiece *)explosion {
}
@end

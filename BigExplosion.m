

#import "BigExplosion.h"

@implementation BigExplosion
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"bigexplosion" numFrames:6])) return nil;
    [self setPerFrameTime:TIMETOEXPIREBIGEXPLOSION / 6];
    [self setTimeToExpire:TIMETOEXPIREBIGEXPLOSION];
    return self;
}

- (void)explode:(GamePiece *)explosion {
}
@end

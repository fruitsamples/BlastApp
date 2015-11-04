

#import "DropShipExplosion.h"

@implementation DropShipExplosion
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"dropshipexplosion" numFrames:6])) return nil;
    [self setPerFrameTime:200];
    [self setTimeToExpire:1000];
    return self;
}

- (void)explode:(GamePiece *)explosion {
}
@end

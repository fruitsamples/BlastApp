

#import "MissileBaseExplosion.h"

@implementation MissileBaseExplosion
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"mbexplosion" numFrames:8])) return nil;
    [self setPerFrameTime:100];
    [self setTimeToExpire:800];
    return self;
}
@end



#import "HangingBaseExplosion.h"

@implementation HangingBaseExplosion
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"hbexplosion" numFrames:6])) return nil;
    [self setPerFrameTime:150];
    [self setTimeToExpire:900];
    return self;
}
@end

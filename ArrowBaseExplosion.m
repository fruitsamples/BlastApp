

#import "ArrowBaseExplosion.h"

@implementation ArrowBaseExplosion
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"arrowbaseexplosion" numFrames:6])) return nil;
    [self setPerFrameTime:150];
    [self setTimeToExpire:900];
    return self;
}
@end

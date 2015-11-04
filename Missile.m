

#import "Missile.h"

@implementation Missile
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"missile" numFrames:2])) return nil;
    [self setPerFrameTime:100];
    [self setTimeToExpire:2000];
    return self;
}
@end


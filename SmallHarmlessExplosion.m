

#import "SmallHarmlessExplosion.h"

@implementation SmallHarmlessExplosion
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"smallexplosion" numFrames:8])) return nil;
    [self setPerFrameTime:100];
    [self setTimeToExpire:800];
    return self;
}
@end

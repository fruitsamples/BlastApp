

#import "HelicopterExplosion.h"

@implementation HelicopterExplosion
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"hexplosion" numFrames:10])) return nil;
    [self setPerFrameTime:200];
    [self setTimeToExpire:2000];
    return self;
}
@end



#import "BackShooterExplosion.h"

@implementation BackShooterExplosion
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"backshooterexplosion" numFrames:5])) return nil;
    [self setPerFrameTime:150];
    [self setTimeToExpire:750];
    return self;
}
@end

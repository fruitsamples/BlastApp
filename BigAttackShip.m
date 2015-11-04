

#import "BigAttackShip.h"

@implementation BigAttackShip
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"redmine" numFrames:1])) return nil;
    [self setPerFrameTime:100000000];
    return self;
}
@end

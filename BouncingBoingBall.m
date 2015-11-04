

#import "BouncingBoingBall.h"

@implementation BouncingBoingBall
- (id)initInGame:(Game *)g {
    [super initInGame:g];
    [self setAcceleration:NSMakeSize(0.0, -25)];
    return self;
}
@end

#import "DonutMine.h"
#import "Helicopter.h"
#import "Game.h"

@implementation DonutMine
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"donut" numFrames:1])) return nil;
    [self setPerFrameTime:100000000];
    return self;
}

- (void)explode {
}

- (void)setLocation:(NSPoint)newLocation {
    NSSize tmpVel = vel;
    [super setLocation:newLocation];
    if (!NSEqualSizes(tmpVel, vel)) {
        if ([Game randInt:2] == 0 && [game helicopter] != nil && [self isWithin:DONUTDISTANCE ofPiece:[game helicopter]]) {
	    [self setVelocity:NSMakeSize(tmpVel.width, ((vel.height < 0) ? -1 : 1) * MAXVELY)];
        } else {
            [self setVelocity:NSMakeSize(tmpVel.width, ((vel.height < 0) ? -1 : 1) * MAXVELY / 5.0)];
        }
    }
}
@end

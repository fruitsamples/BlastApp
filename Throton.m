#import "Throton.h"
#import "Game.h"

@implementation Throton
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"throton" numFrames:3])) return nil;
    [self setPerFrameTime:200];
    return self;
}

- (void)explode {
    if (!exploded) {
        [game addScore:MINESCORE];
        [self setPerFrameTime:1000];
        exploded = YES;
	[self setVelocity:NSMakeSize(vel.width, MAXVELY / 6.0)];	// ??? Didn't use to call the method
    }
}

- (void)setLocation:(NSPoint)newLocation {
    if (exploded && newLocation.y < lowPoint) {
        newLocation = NSMakePoint(newLocation.x, [Game maxFloat:lowPoint :newLocation.y]);
        [self setVelocity:NSMakeSize(vel.width, 0.0)];	// ??? Didn't use to call the method
        [self setPerFrameTime:4000];
    }
    [super setLocation:newLocation];
}
@end

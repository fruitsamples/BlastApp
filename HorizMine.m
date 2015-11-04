#import "HorizMine.h"
#import "Game.h"

@implementation HorizMine
- (void)setLeft:(CGFloat)left right:(CGFloat)right {
    leftPoint = left;
    rightPoint = right;
}

- (void)setLocation:(NSPoint)newLocation {
    if (newLocation.x + pos.size.width > rightPoint || newLocation.x < leftPoint) {
	[self setVelocity:NSMakeSize(-vel.width, vel.height)];	/* ??? Didn't use to call the method */
        newLocation = NSMakePoint([Game minFloat:rightPoint - pos.size.width :[Game maxFloat:leftPoint :newLocation.x]], newLocation.y);
    }
    [super setLocation:newLocation];
}
@end

#import "Mine.h"
#import "Game.h"

@implementation Mine
- (void)setHigh:(CGFloat)hi low:(CGFloat)lo {
    highPoint = hi;
    lowPoint = lo;
}

- (void)setLocation:(NSPoint)newLocation {
    if (newLocation.y + pos.size.height > highPoint || newLocation.y < lowPoint) {
        [self setVelocity:NSMakeSize(vel.width, -vel.height)];	/* ??? Didn't use to call the method */
        newLocation = NSMakePoint(newLocation.x, [Game minFloat:highPoint - pos.size.height :[Game maxFloat:lowPoint :newLocation.y]]);
    }
    [super setLocation:newLocation];
}
@end

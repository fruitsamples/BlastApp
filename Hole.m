#import "Hole.h"
#import "Helicopter.h"
#import "Game.h"

@implementation Hole
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"hole" numFrames:6 numPoses:1])) return nil;
    [self setPerFrameTime:100];
    return self;
}

- (void)updatePiece {
    Helicopter *helicopter = [game helicopter];
    NSSize heliAcc = NSZeroSize;

    if (helicopter != nil && [self isWithin:HOLEDISTANCE ofPiece:helicopter]) {
        NSRect hRect = [helicopter rect];
        CGFloat dist;
        NSPoint heliMidPoint;
        NSPoint holeMidPoint;
        heliMidPoint = NSMakePoint(NSMidX(hRect), NSMidY(hRect));
        holeMidPoint = NSMakePoint(NSMidX(pos), NSMidY(pos));
        dist = [Game distanceBetweenPoint:heliMidPoint andPoint:holeMidPoint];
        if (dist < HOLEDISTANCE) {
            CGFloat accMag = HOLEACCVALUE * (HOLEDISTANCE - dist) / HOLEDISTANCE;
            CGFloat xDelta = holeMidPoint.x - heliMidPoint.x;
            CGFloat yDelta = holeMidPoint.y - heliMidPoint.y;
            CGFloat tot = abs(xDelta) + abs(yDelta);
            heliAcc = NSMakeSize(accMag * xDelta / tot, accMag * yDelta / tot);
        }
    }
    if (helicopter != nil) [helicopter setAcceleration:heliAcc];	/* ??? Do this all the time? */
    [super updatePiece];
}

- (void)explode {
}

- (BOOL)touches:(GamePiece *)obj {
    if ([super touches:obj]) {
        return [obj touchesRect:NSMakeRect(NSMidX(pos) - 2.0, NSMidY(pos) - 2.0, 4.0, 4.0)];
    } else {
        return NO;
    }
}

- (BOOL)touchesRect:(NSRect)rect {
    if ([super touchesRect:rect]) {
        return [GamePiece intersectsRects:rect :(NSMakeRect(NSMidX(pos) - 2.0, NSMidY(pos) - 2.0, 4.0, 4.0))];
    } else {
        return NO;
    }
}
@end

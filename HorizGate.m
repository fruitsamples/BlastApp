

#import "HorizGate.h"

@implementation HorizGate
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"hblock" numFrames:1 numPoses:2])) return nil;
    [self setPerFrameTime:10000000];
    return self;
}

- (BOOL)touches:(GamePiece *)obj {
    if ([super touches:obj]) {
        if ([self isClosed]) return YES;	// If closed, the whole gate is bad...
        if ([obj touchesRect:NSMakeRect(pos.origin.x, pos.origin.y, 5.0, 5.0)] || [obj touchesRect:NSMakeRect(NSMaxX(pos) - 5.0, pos.origin.y, 5.0, 5.0)]) return YES;
    }
    return NO;
}

- (BOOL)touchesRect:(NSRect)rect {
    if ([super touchesRect:rect]) {
        if ([self isClosed]) return YES;	// If closed, the whole gate is bad...
        if ([GamePiece intersectsRects:rect :NSMakeRect(pos.origin.x, pos.origin.y, 5.0, 5.0)] || [GamePiece intersectsRects:rect :NSMakeRect(NSMaxX(pos) - 5.0, pos.origin.y, 5.0, 5.0)]) return YES;
    }
    return NO;
}
@end

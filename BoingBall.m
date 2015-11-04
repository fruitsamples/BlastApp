#import "BoingBall.h"
#import "BigMultipleExplosion.h"
#import "Game.h"

@implementation BoingBall
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"boing" numFrames:1])) return nil;
    [self setPerFrameTime:100000000];
    return self;
}

- (BOOL)touches:(GamePiece *)obj {
    if ([super touches:obj]) {
	CGFloat third = floor(pos.size.width / 3.0);
        return ([obj touchesRect:NSMakeRect(pos.origin.x + third, pos.origin.y + 1.0, third, pos.size.height - 2.0)] ||
                [obj touchesRect:NSMakeRect(pos.origin.x + 1.0, pos.origin.y + third, pos.size.width - 2.0, third)]);
    } else {
        return NO;
    }
}

- (BOOL)touchesRect:(NSRect)rect {
    if ([super touchesRect:rect]) {
	CGFloat third = floor(pos.size.width / 3.0);
        return ([GamePiece intersectsRects:rect :NSMakeRect(pos.origin.x + third, pos.origin.y + 1.0, third, pos.size.height - 2.0)] ||
	        [GamePiece intersectsRects:rect :NSMakeRect(pos.origin.x + 1.0, pos.origin.y + third, pos.size.width - 2.0, third)]);
    } else {
        return NO;
    }
}

- (void)explode {
    id exp = [[BigMultipleExplosion alloc] initInGame:game];
    [game addScore:BOINGSCORE];
    [super explode:exp];
}
@end

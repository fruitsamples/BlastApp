#import "BubbleMine.h"
#import "BigMultipleExplosion.h"
#import "Helicopter.h"
#import "Game.h"

@implementation BubbleMine
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"bubblemine" numFrames:6])) return nil;
    [self setPerFrameTime:90 + [Game randInt:10]];
    return self;
}

- (BOOL)touches:(GamePiece *)obj {
    if ([super touches:obj]) {
        CGFloat third = floor(pos.size.width / 3.0);
        return ([obj touchesRect:NSMakeRect(pos.origin.x + third, pos.origin.y + 2.0, third, pos.size.height - 4.0)] ||
                [obj touchesRect:NSMakeRect(pos.origin.x + 2.0, pos.origin.y + third, pos.size.width - 4.0, third)]);
    } else {
        return NO;
    }
}

- (BOOL)touchesRect:(NSRect)rect {
    if ([super touchesRect:rect]) {
        CGFloat third = floor(pos.size.width / 3.0);
        return ([GamePiece intersectsRects:rect :NSMakeRect(pos.origin.x + third, pos.origin.y + 2.0, third, pos.size.height - 4.0)] ||
                [GamePiece intersectsRects:rect :NSMakeRect(pos.origin.x + 2.0, pos.origin.y + third, pos.size.width - 4.0, third)]);
    } else {
        return NO;
    }
}

- (void)explode {
    NSInteger newPerFrameTime = perFrameTime + [Game randInt:32];
    if (newPerFrameTime > 250) {
        id exp = [[BigMultipleExplosion alloc] initInGame:game];
        [game addScore:MINESCORE];
        [super explode:exp];
    } else {
        [self setPerFrameTime:newPerFrameTime takeEffectNow:NO];
    }
}

- (void)updatePiece {
    Helicopter *helicopter = [game helicopter];

    if (helicopter != nil && [self isWithin:BUBBLEMINEDISTANCE ofPiece:helicopter]) {
        NSSize newVel;
        NSRect hRect = [helicopter rect];
        if (hRect.origin.y > NSMidY(pos)) {
            newVel = NSMakeSize(0.0, MAXVELY / 10.0);
        } else {
            newVel = NSMakeSize(0.0, -MAXVELY / 10.0);
        }
        [self setVelocity:newVel];
    }
    if (perFrameTime > 100) {
        [self setPerFrameTime:perFrameTime - [game elapsedTime] / 20 takeEffectNow:NO];
    }
    [super updatePiece];
}
@end

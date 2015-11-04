#import "DropShip.h"
#import "DropShipExplosion.h"
#import "EnemyBullet.h"
#import "Helicopter.h"
#import "Game.h"

@implementation DropShip
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"dropship" numFrames:1])) return nil;
    [self setPerFrameTime:100000000];
    return self;
}

/* 4x4 rectangle under the nose section is untouchable... */

- (BOOL)touches:(GamePiece *)obj {
    if ([super touches:obj]) {
        return [obj touchesRect:NSMakeRect(pos.origin.x, pos.origin.y + 4.0, pos.size.width, pos.size.height - 4.0)] ||
	       [obj touchesRect:NSMakeRect(pos.origin.x + 4.0, pos.origin.y, pos.size.width - 4.0, 4.0)];
    } else {
        return NO;
    }
}

- (BOOL)touchesRect:(NSRect)rect {
    if ([super touchesRect:rect]) {
        return [GamePiece intersectsRects:rect :NSMakeRect(pos.origin.x, pos.origin.y + 4.0, pos.size.width, pos.size.height - 4.0)] ||
	       [GamePiece intersectsRects:rect :NSMakeRect(pos.origin.x + 4.0, pos.origin.y, pos.size.width - 4.0, 4.0)];
    } else {
        return NO;
    }
}

- (void)explode {
    id exp = [[DropShipExplosion alloc] initInGame:game];
    [game addScore:DROPSHIPSCORE];
    [self explode:exp];
}


- (void)updatePiece {
   if ([game updateTime] > nextFireTime) {
        Helicopter *helicopter = [game helicopter];
	NSSize newVelocity = NSZeroSize;
        if (helicopter != nil && [self isInFrontAndWithin:DROPSHIPDISTANCE ofPiece:helicopter]) {            
            NSRect helicopterRect = [helicopter rect];
            GamePiece *missile = [[EnemyBullet alloc] initInGame:game];
            NSPoint bulletLocation = NSMakePoint(pos.origin.x, pos.origin.y + 7.0);
            NSSize bulletVelocity = NSMakeSize(-BULLETVEL, 0.0);
            if (NSMaxY(helicopterRect) < pos.origin.y) {
                bulletVelocity.height = -BULLETVEL/5.0;
            } else if (helicopterRect.origin.y > NSMaxY(pos)) {
                bulletVelocity.height = BULLETVEL/5.0;
            }
            [missile setVelocity:bulletVelocity];
            [missile setLocation:bulletLocation];
            [game addGamePiece:missile];
            [game playEnemyFireSound];
            newVelocity = NSMakeSize(0.0, (NSMidY(helicopterRect) - NSMidY(pos)) / (CGFloat)[Game timeInSeconds:TIMETOADJUSTDROPSHIP]);
            nextFireTime = [game updateTime] + TIMETOADJUSTDROPSHIP;
        }
        [super updatePiece];
        [self setVelocity:newVelocity];
    } else {
        [super updatePiece];
    }
}
@end

#import "SmartMissile.h"
#import "Game.h"

@implementation SmartMissile
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"smartmissile" numFrames:1])) return nil;
    [self setPerFrameTime:2500];
    [self setTimeToExpire:2500];
    return self;
}

- (void)updatePiece {
    Helicopter *helicopter = [game helicopter];

    if (helicopter != nil && [game updateTime] > nextAdjustTime) {
        NSRect hRect = [helicopter rect];
        [self setAcceleration:NSMakeSize(2.0 * (NSMidX(hRect) - pos.origin.x - vel.width), 2.0 * (NSMidY(hRect) - pos.origin.y - vel.height))];
        nextAdjustTime = [game updateTime] + TIMETOADJUSTSMARTMISSILE;
    }
    [super updatePiece];
}
@end

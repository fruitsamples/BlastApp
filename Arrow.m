#import "Arrow.h"
#import "Helicopter.h"
#import "Game.h"

@implementation Arrow

- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"arrow" numFrames:7])) return nil;
    [self setPerFrameTime:100];
    [self setTimeToExpire:2500];
    nextUpdateTime = [game updateTime] + TIMETOADJUSTARROW;
    return self;
}

- (void)updatePiece {
    Helicopter *helicopter = [game helicopter];

    if (helicopter != nil && [game updateTime] > nextUpdateTime) {
        NSRect hRect = [helicopter rect];
        NSSize newVelocity = NSMakeSize(vel.width, [Game restrictValue:(NSMidY(hRect) - NSMidY(pos)) / (CGFloat)[Game timeInSeconds:TIMETOADJUSTARROW] toPlusOrMinus:MAXVELY / 2.0]);
        [self setVelocity:newVelocity];
        nextUpdateTime = [game updateTime] + TIMETOADJUSTARROW;
    }
    [super updatePiece];
}

@end

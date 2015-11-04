#import "SmartAttackShip.h"
#import "Game.h"

@implementation SmartAttackShip
- (void)updatePiece {
    Helicopter *helicopter = [game helicopter];

    if ((vel.width != 0) && helicopter != nil && [game updateTime] > nextAdjustTime) {
        NSRect hRect = [helicopter rect];
        NSSize newVel = NSMakeSize(vel.width, [Game restrictValue:NSMidY(hRect) - NSMidY(pos) toPlusOrMinus:MAXVELY / 2.0]);
        [self setVelocity:newVel];
        nextAdjustTime = [game updateTime] + TIMETOADJUSTATTACKSHIP;	
    }
    [super updatePiece];
}
@end

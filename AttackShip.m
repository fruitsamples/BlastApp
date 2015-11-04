#import "AttackShip.h"
#import "Helicopter.h"
#import "Game.h"

@implementation AttackShip
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"smartmine" numFrames:1])) return nil;
    [self setPerFrameTime:100000000];
    return self;
}

- (void)explode {
    if (++nHits == REQUIREDATTACKSHIPHITS) {
        [game addScore:ATTACKSHIPSCORE];
        [super explode];
    }
}

- (void)updatePiece {
    Helicopter *helicopter = [game helicopter];

    if (vel.width == 0 && helicopter != nil && [self isWithin:ATTACKSHIPDISTANCE + [Game randInt:ATTACKSHIPDISTANCE/10] ofPiece:helicopter]) {
        NSRect hRect = [helicopter rect];
        NSSize newVel = NSMakeSize(-ATTACKSHIPVEL, [Game restrictValue:NSMidY(hRect) - NSMidY(pos) toPlusOrMinus:MAXVELY / 2.0]);
        [self setTimeToExpire:TIMETOEXPIREATTACKSHIP];
        [self setVelocity:newVel];	
    }
    [super updatePiece];
}
@end

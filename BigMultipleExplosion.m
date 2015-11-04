#import "BigMultipleExplosion.h"
#import "Game.h"

@implementation BigMultipleExplosion
- (id)initInGame:(Game *)g {
    [super initInGame:g];
    nextChangeTime = [game updateTime] + TIMETOEXPLODEBIGMULTIPLE;
    return self;
}

- (void)setGeneration:(NSInteger)gen {
    generation = gen;
}

- (void)updatePiece {
    if ([game updateTime] > nextChangeTime && generation < MAXBIGMULTIPLEGENERATION) {
        NSSize newVel = NSMakeSize(vel.width / 2.0, vel.height / 2.0);
        NSInteger cnt;
        for (cnt = 0; cnt < 4; cnt += 1) {
            BigMultipleExplosion *exp = [[BigMultipleExplosion alloc] initInGame:game];
            NSPoint newLoc = NSMakePoint(pos.origin.x + (((cnt & 1) != 0) ? 1 : -1) * (MINBIGMULTIPLEOFFSET + [Game randInt:MAXBIGMULTIPLEOFFSET - MINBIGMULTIPLEOFFSET]), pos.origin.y + (((cnt & 2) != 0) ? 1 : -1) * (MINBIGMULTIPLEOFFSET + [Game randInt:MAXBIGMULTIPLEOFFSET - MINBIGMULTIPLEOFFSET]));
            [exp setLocation:newLoc];
	    [exp setVelocity:newVel];
	    [exp setGeneration:generation + 1];
            [game addGamePiece:exp];
        }
        nextChangeTime = [game updateTime] + TIMETOEXPLODEBIGMULTIPLE;
        [game playExplosionSound];
    }
    [super updatePiece];
}
@end

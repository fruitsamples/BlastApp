#import "ProximityMine.h"
#import "BigExplosion.h"
#import "Helicopter.h"
#import "Game.h"

@implementation ProximityMine
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"proximitymine" numFrames:1])) return nil;
    [self setPerFrameTime:100000000];
    return self;
}

- (void)updatePiece {
    if (explodeTime == 0 && [game helicopter] != nil && [self isWithin:PROXIMITYMINEDISTANCE ofPiece:[game helicopter]]) {
        explodeTime = [game updateTime] + TIMETODETONATEPROXIMITYMINE;
    } else if (explodeTime > 0) {
        if ([game helicopter] == nil) {
            explodeTime = 0;	// Abort explosion...
        } else if ([game updateTime] > explodeTime) {
            id exp = [[BigExplosion alloc] initInGame:game];
	    [super explode:exp];
            return;
        }
    }
    [super updatePiece];
}

- (void)explode {
}
@end

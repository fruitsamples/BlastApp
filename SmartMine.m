#import "SmartMine.h"
#import "SmartMineExplosion.h"
#import "Helicopter.h"
#import "Game.h"

@implementation SmartMine
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"smartmine" numFrames:1])) return nil;
    [self setPerFrameTime:100000000];
    return self;
}

- (NSInteger)requiredHits {
    return REQUIREDSMARTMINEHITS;
}

- (CGFloat)detectDistance {
    return SMARTMINEDISTANCE;
}

- (void)explode {
    if (++nHits == [self requiredHits]) {
        id exp = [[SmartMineExplosion alloc] initInGame:game];
        [game addScore:MINESCORE];
        [self explode:exp];
    }
}

- (void)updatePiece {
    Helicopter *helicopter = [game helicopter];

    if (helicopter != nil && [self isWithin:[self detectDistance] ofPiece:helicopter]) {
        NSRect hRect = [helicopter rect];
        if ((hRect.origin.y > NSMaxY(pos) && vel.height < 0.0) || (NSMaxY(hRect) < pos.origin.y && vel.height > 0.0)) {
            [self setVelocity:NSMakeSize(0.0, -vel.height)];	
        }
    }
    [super updatePiece];
}
@end

#import "SmartHangingBase.h"
#import "Helicopter.h"
#import "Game.h"

@implementation SmartHangingBase
- (id)initInGame:(Game *)g {
    [super initInGame:g];
    [self setPerFrameTime:100000000];
    return self;
}

- (CGFloat)detectDistance {
    return SMARTHANGINGBASEDISTANCE;
}

- (void)updatePiece {
    Helicopter *helicopter = [game helicopter];
    if (helicopter != nil) {
        NSRect helicopterRect = [helicopter rect];

        if ([self isInFrontAndWithin:[self detectDistance] ofPiece:helicopter] && [game updateTime] > nextUpdateTime) {
            if (NSMaxY(helicopterRect) >= pos.origin.y) {
                curImage = (curImage + 1) & 1;	// Images 0 & 1 point up
            } else {
                curImage = ((curImage + 1) & 3) | 2;	// 2 & 3 point down
            }
            nextUpdateTime = [game updateTime] + TIMETOADJUSTSMARTHANGINGBASE;
        }
    }
    [super updatePiece];
}
@end

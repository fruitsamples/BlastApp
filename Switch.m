#import "Switch.h"
#import "SwitchedVertGate.h"
#import "Game.h"

@implementation Switch
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"switch" numFrames:1 numPoses:4])) return nil;
    [self setPerFrameTime:10000000];
    return self;
}

- (void)explode {
    curPose = (curPose + 1) % numPoses;
    BOOL open = (curPose == numPoses - 1);
    NSInteger pieceType, cnt;
    for (pieceType = StationaryEnemyPiece; pieceType <= MobileEnemyPiece; pieceType++) {
        NSArray *pieces = [game piecesOfType:pieceType];
        for (cnt = 0; cnt < [pieces count]; cnt++) {
            GamePiece *piece = [pieces objectAtIndex:cnt];
            if ([piece isKindOfClass:[SwitchedVertGate class]]) {	/* ??? instanceOf -> isKindOf ? */
                if (open) {
                    [(SwitchedVertGate *)piece openGate];
                } else {
                    [(SwitchedVertGate *)piece closeGate];
                }
            }
        }
    }
}
@end

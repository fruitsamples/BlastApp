#import "BombGenerator.h"
#import "Helicopter.h"
#import "Bomb.h"
#import "Game.h"

@implementation BombGenerator
- (NSInteger)pieceType {
    return OtherPiece;
}

- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g image:nil numFrames:0 numPoses:0])) return nil;
    [self setSize:NSMakeSize(0.0, 6.0)];
    [self setPerFrameTime:100000000];
    return self;
}

- (void)updatePiece {
    Helicopter *helicopter = [game helicopter];

    if (helicopter != nil && [game updateTime] > nextFireTime) {
        NSRect hRect = [helicopter rect];
        NSSize backgroundSize = [[game background] size];
        if (NSMidX(hRect) > hRect.size.width / 2.0 + 10 && NSMidX(hRect) < backgroundSize.width - 200.0) {
            GamePiece *bullet = [[Bomb alloc] initInGame:game];
            [bullet setLocation:NSMakePoint(NSMidX(hRect) + 160, 1 + [Game randInt:(NSInteger)(highPoint - lowPoint - [bullet size].height) - 1])];
            [game addGamePiece:bullet];
        }
        if (NSMidX(hRect) > 200.0) {
            GamePiece *bullet = [[Bomb alloc] initInGame:game];
            [bullet setLocation:NSMakePoint(NSMidX(hRect) + 140, 1 + [Game randInt:(NSInteger)(highPoint - lowPoint - [bullet size].height) - 1])];
            [game addGamePiece:bullet];
        }
        nextFireTime = [game updateTime] + TIMETORECHARGEBOMBGENERATOR;
    }
    [super updatePiece];
}
@end

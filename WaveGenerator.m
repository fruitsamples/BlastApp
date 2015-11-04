#import "WaveGenerator.h"
#import "Wave.h"
#import "Helicopter.h"
#import "Game.h"

@implementation WaveGenerator
- (NSInteger)pieceType {
    return OtherPiece;
}

- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g image:nil numFrames:0 numPoses:0])) return nil;
    [self setSize:NSMakeSize(0.0, 6.0)];
    [self setPerFrameTime:10000000];
    return self;
}

- (GamePiece *)wave {
    GamePiece *wave = [[Wave alloc] initInGame:game];
    return wave;
}

- (void)updatePiece {
    NSRect gameBounds;
    Helicopter *helicopter = [game helicopter];

    gameBounds = [game bounds];
    if (helicopter != nil && [game updateTime] > nextFireTime && [self isInFrontAndBetween:gameBounds.size.width and:gameBounds.size.width/2.0 ofPiece:helicopter]) {
        GamePiece *wave = [self wave];
        [wave setLocation:NSMakePoint(pos.origin.x, pos.origin.y)];
        [game addGamePiece:wave];
        nextFireTime = [game updateTime] + (TIMETORECHARGEWAVEGENERATOR * 3) / 4 + [Game randInt:TIMETORECHARGEWAVEGENERATOR / 2];
    }
    [super updatePiece];
}
@end

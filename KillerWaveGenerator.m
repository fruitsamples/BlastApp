

#import "KillerWaveGenerator.h"
#import "KillerWave.h"

@implementation KillerWaveGenerator
- (GamePiece *)wave {
    return [[KillerWave alloc] initInGame:game];
}
@end

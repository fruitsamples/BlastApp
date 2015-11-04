#import "AmeobaMine.h"
#import "Game.h"

@implementation AmeobaMine

- (void)setGeneration:(NSInteger)gen {
    generation = gen;
}

- (void)explode {
    if (generation > MAXAMEOBAGENERATION) {
        [super explode];
    } else {
        AmeobaMine *newMine = [[AmeobaMine alloc] initInGame:game];
        [newMine setHigh:highPoint low:lowPoint];
        [newMine setVelocity:NSMakeSize(-vel.width, -vel.height)];
        [newMine setLocation:NSMakePoint(pos.origin.x, pos.origin.y)];
        [newMine setAcceleration:NSMakeSize(0.0, 0.0)];
        [self setGeneration:generation + 1];
        [newMine setGeneration:generation + 1];
        [game addGamePiece:newMine];
    }
}

@end

#import "BadSheep.h"
#import "Game.h"

@implementation BadSheep
- (void)explode {
    [game addScore:BADSHEEPSCORE];
    [self explode:nil];
}
@end

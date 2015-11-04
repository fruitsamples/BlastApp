#import "Fog.h"
#import "Game.h"

@implementation Fog
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"fog" numFrames:7])) return nil;
    [self setPerFrameTime:100000000];
    curImage = [Game randInt:numImages-1];
    return self;
}


- (void)explode:(GamePiece *)explosion {
}

- (BOOL)touches:(GamePiece *)obj {
    return NO;
}

- (BOOL)touchesRect:(NSRect)rect {
    return NO;
}
@end



#import "LargeMine.h"

@implementation LargeMine
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"largemine" numFrames:3])) return nil;
    [self setPerFrameTime:150];
    return self;
}

- (void)explode:(GamePiece *)explosion {
}
@end

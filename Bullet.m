

#import "Bullet.h"

@implementation Bullet
- (NSInteger)pieceType {
    return FriendlyPiece;
}

- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"bullet" numFrames:1])) return nil;
    [self setPerFrameTime:2000];
    [self setTimeToExpire:2000];
    return self;
}
@end

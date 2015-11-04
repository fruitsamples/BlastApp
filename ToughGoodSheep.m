#import "ToughGoodSheep.h"
#import "Game.h"

@implementation ToughGoodSheep
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"sheep" numFrames:2 numPoses:4])) return nil;
    [self setPerFrameTime:300];
    return self;
}

- (void)updatePiece {
    if ([game updateTime] > nextUpdateTime) {
        switch ([Game randInt:5]) {
            case 0: [self reverseVelocity]; break;
            case 1: curPose &= ~1; break;
            case 2: curPose |= 1; break;
            default: break;
        }
        nextUpdateTime = [game updateTime] + TIMETOADJUSTSHEEP;	
    }
    [super updatePiece];
    if (vel.width < 0) {
        curPose &= ~2;
    } else {
        curPose |= 2;
    }
}

- (void)explode {
}

- (NSInteger)pieceType {
    return OtherPiece;
}

- (BOOL)touches:(GamePiece *)obj {
    if (![super touches:obj]) return NO;	/* Easy case */
    return [obj touchesRect:NSMakeRect(pos.origin.x, pos.origin.y, pos.size.width, pos.size.height - 2.0)];
}

- (BOOL)touchesRect:(NSRect)rect {
    if (![super touchesRect:rect]) return NO;	/* Easy case */
    return [GamePiece intersectsRects:rect :NSMakeRect(pos.origin.x, pos.origin.y, pos.size.width, pos.size.height - 2.0)];
}
@end

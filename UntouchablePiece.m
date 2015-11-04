

#import "UntouchablePiece.h"

@implementation UntouchablePiece
- (NSInteger)pieceType {
    return OtherPiece;
}

- (BOOL)touches:(GamePiece *)obj {
    return NO;
}

- (BOOL)touchesRect:(NSRect)rect {
    return NO;
}

- (void)explode:(GamePiece *)explosion {
}
@end




#import "FatSentry.h"

@implementation FatSentry
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"fatsentry" numFrames:4])) return nil;
    return self;
}

- (void)explode:(GamePiece *)explosion {
}
@end

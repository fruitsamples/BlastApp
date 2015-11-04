

#import "Sentry.h"

@implementation Sentry
- (id)initInGame:(Game *)g {
    if (!(self = [self initInGame:g imageName:@"sentry" numFrames:4])) return nil;
    return self;
}

- (void)explode:(GamePiece *)explosion {
}
@end

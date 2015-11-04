#import "GamePiece.h"

#define ZEROVELTHRESHOLD 2.0

@interface Helicopter:GamePiece {
     NSInteger command;
     BOOL fireRequested;
     NSInteger nextFireTime;	/* ms */
}

- (void)setVelocity:(NSSize)newVelocity;
- (void)setCommand:(NSInteger)cmd;

- (void)startFiring;
- (void)stopFiring;
- (BOOL)fireRequested;

@end


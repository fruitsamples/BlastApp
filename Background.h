#import "GamePiece.h"

@class Mine;
@class HorizMine;

#define MAXLEVELS 30	/* Changing this will make highscores incompatible! */

@interface Background:GamePiece {   
    NSInteger maxLevelSpecs;                  /* Maximum number of code points in any level */
    NSInteger numLandscapeSpecs;		/* Number of code points specified in cur level (actually one less) */
    NSInteger landscapeWidthInPixels;         /* Total width of landscape, and hence the background image; numLandscapeSpecs * LANDSCAPEWIDTHPERSPEC */
    NSRect gameRect;			/* Rect describing the current level game area */

    short *bottom;                      /* Describes the ceiling in the current level */
    short *top;                         /* Describes the ground in the current level */
    NSInteger bottomSpec;                     /* Location of current level bottom spec in levelData */
    NSInteger topSpec;                        /* Location of current level top spec in levelData */
    NSInteger gamePieces;                     /* Location of current level pieces spec in levelData */
    NSString *levelDescription;
    NSString *levelFileIdentifier;
    NSData *levelDataAsData;
    NSInteger currentLevel;
    NSInteger numLevels;
    NSColor *groundColor;
}

- (BOOL)initializeLevelData:(NSData *)data;
- (NSInteger)numLevels;
- (void)setLevel:(NSInteger)level;
- (NSString *)levelDescription;
- (NSString *)levelFileIdentifier;

- (NSRect)clearRectFrom:(CGFloat)startLoc to:(CGFloat)endLoc;

- (NSRect)gameRect;

- (void)createLandscape;
- (void)drawLandscape;
- (void)washToBlack:(NSColor *)color size:(NSSize)size;
- (void)washToWhite:(NSColor *)color size:(NSSize)size;

- (void)putMine:(Mine *)mine :(NSInteger)loc :(CGFloat)yVel;
- (void)putMine:(Mine *)mine :(NSInteger)loc :(CGFloat)yVel :(CGFloat)locFromBottomPercentage;
- (void)putHorizMine:(HorizMine *)mine :(NSInteger)loc :(CGFloat)yVel :(CGFloat)locFromBottomPercentage;

@end


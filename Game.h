#import <Cocoa/Cocoa.h>
#import "GamePiece.h"

@class Background;
@class Helicopter;
@class GamePiece;
@class RemainingHelicopters;
@class InputIndicator;

enum {
    /* User commands */
    NoCommand = 0,
    GoUpCommand = 1,
    GoUpRightCommand = 2,
    GoRightCommand = 3,
    GoDownRightCommand = 4,
    GoDownCommand = 5,
    GoDownLeftCommand = 6,
    GoLeftCommand = 7,
    GoUpLeftCommand = 8,
    StopCommand = 9,
    FireCommand = 10,
    NumCommands = 11
};

enum {
    /* Maximum velocity (in pixel/seconds) for any object in the game */
    MAXVELX = 65,
    MAXVELY = 65,
    MINVELX = 1,
    MINVELY = 1
};

enum {
    HELICOPTERSTARTX = 2,
    HELICOPTERSTARTY = 80
};

enum {
    /* Maximum time a frame can take. This is the maximum value returned by the elapsedTime method. */
    MAXUPDATETIME = 100
};

enum {
    TIMING = 0
};

#define ANIMATIONINTERVAL (0.04)
#define RANDINT(n) [Game randInt:(n)]

enum {
    MAXBONUSTIME = 120000,	/* ms */
    /* Bonus for finishing a level in under MAXBONUSTIME */
    BONUS = 10
};


@interface Game:NSView {
    /* Timing related */
    BOOL timing;
    NSInteger timingTime;
    NSInteger timingFrames;
    NSInteger timingMissed;

    /* "Cheat" (or "test") mode. If not zero, this stores the number of times hit while in cheat mode. */
    NSInteger cheating;	

    /* Vectors of GamePieces, grouped by piece type */
    NSMutableArray *pieces[LastGamePiece]; 

    /* References to some special pieces... */
    Background *background;
    Helicopter *helicopter;
    GamePiece *focusObject;

    /* Outlets to UI elements */
    NSTextField *statusField;
    NSTextField *scoreField;
    RemainingHelicopters *livesField;
    NSTextField *levelField;
    NSTextField *highscoreField;
    InputIndicator *inputIndicator;
    NSButton *pauseButton;

    /* The next three are UI gadgets in the Prefs panel */
    NSMatrix *levelMatrix;
    NSSlider *levelSlider;
    NSTextField *levelPrefsIndicator;
    NSButton *soundPrefItem;

    /* Game variables */
    NSTimer *timer;
    NSPoint lastOrigin;
    BOOL gameOver;	
    BOOL bonusGiven;	
    BOOL newHighScore;	// Indicates a new high score was reached
    BOOL started;	// If true, indicates the helicopter started moving in this level
    NSInteger score, lives, level, highScore, highLevel, numFrames;

    /*
        updateTime is the game clock; only stops when paused.
        updateTime is updated only between frames.
        elapsedTime is the time since last frame.
        timeStopped is the time game was stopped (including overrun frames)
        pausedAt is the time at which the game was paused.
        levelStartedAt is the time at which the helicopter started moving
        at this level. Used in determining bonus points. If -1, then the
        helicopter is still at the start of the level.
    */
    NSInteger updateTime, elapsedTime, timeStopped, pausedAt, levelStartedAt;	/* ms */
    NSDate *gameStartTime;
    NSInteger lastCommand;

    BOOL isDemo;
}

/* ??? These need to be made into functions */
+ (NSInteger)randInt:(NSInteger)n;
+ (BOOL)oneIn:(NSInteger)n;
+ (double)timeInSeconds:(NSInteger)ms;
+ (NSInteger)secondsToMilliseconds:(double)seconds;
+ (CGFloat)restrictValue:(CGFloat)val toPlusOrMinus:(CGFloat)max;
+ (CGFloat)distanceBetweenPoint:(NSPoint)p1 andPoint:(NSPoint)p2;
+ (NSInteger)minInt:(NSInteger)a :(NSInteger)b;
+ (NSInteger)maxInt:(NSInteger)a :(NSInteger)b;
+ (CGFloat)minFloat:(CGFloat)a :(CGFloat)b;
+ (CGFloat)maxFloat:(CGFloat)a :(CGFloat)b;

+ (BOOL)setUpSounds;

- (NSInteger)timeInMsSinceGameBegan;
- (NSInteger)updateTime;
- (NSInteger)elapsedTime;

- (Helicopter *)helicopter;
- (Background *)background;
- (NSArray *)piecesOfType:(NSInteger)type;

- (void)removeGamePiece:(GamePiece *)piece;
- (void)addGamePiece:(GamePiece *)piece;
- (void)setFocusObject:(GamePiece *)piece;
- (NSRect)currentBackgroundPosition;

- (void)addScore:(NSInteger)points;

- (void)playEnemyFireSound;
- (void)playFriendlyFireSound;
- (void)playExplosionSound;
- (void)playLoudExplosionSound;

- (void)markGameAsRunning;

- (void)startGame:(id)sender;
- (void)startGame:(id)sender atLevel:(NSInteger)startingLevel;

- (void)stop:(id)sender;
- (void)go:(id)sender;
- (BOOL)isPaused;
- (void)togglePause:(id)sender;

- (void)stopLastCommand;

- (void)stopGameFor:(NSInteger)timeAdj;

- (void)startLevel:(NSInteger)newLevel;
- (void)restartLevel;

- (void)setDemo:(BOOL)flag;
- (BOOL)isDemo;

- (void)showPrefs:(id)sender;

- (void)readHighScore;
- (void)updateHighScore;
- (void)updateSoundPref;

- (void)setSoundRequested:(BOOL)flag;

- (void)displayRunningMessage;

@end


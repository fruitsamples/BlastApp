#import <Cocoa/Cocoa.h>

@class Game;

/* ??? Separate these values */
enum {
    DEFAULTPERFRAMETIME = 200,	/* ms */

    /* Velocities in pixels/sec */
    BULLETVEL = 65,
    ARROWVEL = 90,
    ATTACKSHIPVEL = 90,

    /* Time to recharge the helicopter's gun */
    TIMETORECHARGE = 500,

    /* Time to recharge the missile bases and adjust various smart missiles */
    TIMETORECHARGEMISSILE = 2000,
    TIMETORECHARGESMARTMISSILE = 4000,
    TIMETORECHARGEENEMYBULLET = 3000,
    TIMETORECHARGERAPIDENEMYBULLET = 200,
    TIMETORECHARGERAPIDMISSILE = 300,
    TIMETORECHARGEARROW = 4000,
    TIMETOADJUSTSMARTMISSILE = 500,
    TIMETOADJUSTDROPSHIP = 1000,
    TIMETOADJUSTARROW = 300,
    TIMETOADJUSTSMARTHANGINGBASE = 300,
    TIMETODETONATEPROXIMITYMINE = 2000,
    TIMETOEXPIREATTACKSHIP = 2000,
    TIMETOADJUSTATTACKSHIP = 700,
    TIMETOADJUSTSHEEP = 2000,
    TIMETOEXPIREBIGEXPLOSION = 600,
    TIMETOEXPLODEBIGMULTIPLE = (TIMETOEXPIREBIGEXPLOSION * 2 / 3),
    TIMETORECHARGEWAVEGENERATOR = 800,
    TIMETORECHARGEBOMBGENERATOR = 2000,
    TIMETORECHARGESPIDER = 8000,
    TIMETORECHARGETOUGHSPIDER = 500,
    TIMETOSLOWRECHARGETOUGHSPIDER = 2500,
    TIMETOUNSTUNSPIDER = 12000,
    TIMETOADJUSTKILLERMISSILE = 1000,
    TIMETOADJUSTBOMB = 1000,
    TIMETORECHARGEKILLERMISSILE = 2000,

    TIMETOCHANGEGATE = 2000,
    TIMETOOPENGATE = 100,
    TIMETOCLOSEGATE = 2000,
    TIMETOCLOSEAUTOGATE = 6000,
    TIMETOCHANGESWITCHEDGATE = 1000,
    TIMETOCLOSESWITCHEDGATE = 10000,

    // Distance within which the various enemy bases will fire
    // (Note that helicopter bullet speed is 65 and it lives for 2 seconds)
    MISSILEDISTANCE = 25,
    HANGINGBASEDISTANCE = 125,
    SMARTHANGINGBASEDISTANCE = 140,
    SNEAKYHANGINGBASEDISTANCE = 40,
    SMARTMISSILEDISTANCE = 75,
    KILLERMISSILEDISTANCE = 200,
    SMARTMINEDISTANCE = 40,
    ARROWDISTANCE = 250,
    DROPSHIPDISTANCE = 160,
    BACKSHOOTERDISTANCE = 250,
    PROXIMITYMINEDISTANCE = 20,
    ATTACKSHIPDISTANCE = 125,
    // If this is increased might have to fix level 20
    MAXBIGMULTIPLEOFFSET = 35,
    MINBIGMULTIPLEOFFSET = 10,
    SPIDERDISTANCE = 150,
    BUBBLEMINEDISTANCE = 60,
    HOLEDISTANCE = 200,
    DONUTDISTANCE = 30,

    MISSILEBASESCORE = 1,
    HANGINGBASESCORE = 1,
    MINESCORE = 1,
    BACKSHOOTERSCORE = 1,
    DROPSHIPSCORE = 1,
    ARROWBASESCORE = 1,
    ATTACKSHIPSCORE = 1,
    GOODSHEEPSCORE = 2,
    BADSHEEPSCORE = 1,
    BOINGSCORE = 1,
    SPIDERSCORE = 1,
    BOMBSCORE = 1,

    REQUIREDSMARTMINEHITS = 3,
    REQUIREDATTACKSHIPHITS = 3,
    REQUIREDWAVEHITS = 2,
    REQUIREDSPIDERHITS = 2,

    MAXAMEOBAGENERATION = 3,
    MAXBIGMULTIPLEGENERATION = 1,

    HELICOPTERACCVALUE = 120,
    HOLEACCVALUE = 80,

    // Types of game pieces
    FriendlyPiece = 0,
    StationaryEnemyPiece = 1,
    MobileEnemyPiece = 2,
    OtherPiece = 3,
    LastGamePiece = 4
};

#define FireFromMiddlePoint NSMakePoint(-10000,-10000)

@interface GamePiece:NSObject {
     NSSize vel;
     NSSize acc;
     NSRect pos;
     NSImage *images;
     NSInteger numImages;
     NSInteger curImage;
     NSInteger numPoses;
     NSInteger curPose;
     NSInteger aliveUntil;		/* ms */
     NSInteger perFrameTime;		/* ms */
     NSInteger nextFrameTime;		/* ms */
     Game *game;
}

/* Designated initializer for GamePiece
*/
- (id)initInGame:(Game *)g image:(NSImage *)frames numFrames:(NSInteger)nf numPoses:(NSInteger)np cache:(BOOL)cacheFlag;
- (id)initInGame:(Game *)g image:(NSImage *)frames numFrames:(NSInteger)nf numPoses:(NSInteger)np;
- (id)initInGame:(Game *)g imageName:(NSString *)imageName numFrames:(NSInteger)nf numPoses:(NSInteger)np;
- (id)initInGame:(Game *)g imageName:(NSString *)imageName numFrames:(NSInteger)nf;
- (id)initInGame:(Game *)g;
- (void)setSize:(NSSize)newSize;
- (void)setLocation:(NSPoint)newLocation;
- (void)setPerFrameTime:(NSInteger)time;
- (void)setPerFrameTime:(NSInteger)time takeEffectNow:(BOOL)nowFlag;
- (NSPoint)location;
- (NSSize)size;
- (NSRect)rect;
- (void)reverseVelocity;
- (void)setVelocity:(NSSize)newVel;
- (NSSize)velocity;
- (void)setAcceleration:(NSSize)newAcc;
- (NSSize)acceleration;
- (void)setTimeToExpire:(NSInteger)time;
- (void)frameChanged;
- (BOOL)touches:(GamePiece *)obj;
- (BOOL)touchesRect:(NSRect)rect;
- (BOOL)isWithin:(CGFloat)dist ofPiece:(GamePiece *)obj;
- (BOOL)isInFrontAndWithin:(CGFloat)dist ofPiece:(GamePiece *)obj;
- (BOOL)isInBackAndWithin:(CGFloat)dist ofPiece:(GamePiece *)obj;
- (BOOL)isInFrontAndBetween:(CGFloat)farDist and:(CGFloat)nearDist ofPiece:(GamePiece *)obj;
- (void)updatePiece;
- (BOOL)isVisibleIn:(NSRect)rect;
- (void)draw:(NSRect)gameRect;

- (NSInteger)pieceType;

- (void)fireBullet:(GamePiece *)bullet speed:(CGFloat)speed towardsPiece:(GamePiece *)obj smart:(BOOL)smart from:(NSPoint)fireFrom;	
- (void)flyTowardsPiece:(GamePiece *)obj smart:(BOOL)smart;
- (void)explode;
- (void)explode:(GamePiece *)explosion;

- (void)playExplosionSound;

/* ??? Should be a function */
+ (BOOL)intersectsRects:(NSRect)a :(NSRect)b;

+ (void)cacheImage:(NSImage *)image;
+ (void)cacheImageNamed:(NSString *)name;



@end


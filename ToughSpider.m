#import "ToughSpider.h"
#import "Game.h"

@implementation ToughSpider
- (NSInteger)rechargeTime {
    if (((([game updateTime] / 1000) % 10) == 0) || [Game randInt:12] == 0) {
        return TIMETOSLOWRECHARGETOUGHSPIDER;
    } else {
        return TIMETORECHARGETOUGHSPIDER;
    }
}
@end

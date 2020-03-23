#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    NSDictionary *hoursWithStringRepresantation = [[NSDictionary alloc] initWithObjectsAndKeys:@"one" , @"1", @"two" , @"2",@"three" , @"3",@"four" , @"4",@"five" , @"5",@"six" , @"6",@"seven" , @"7",@"eight" , @"8",@"nine" , @"9",@"ten" , @"10",@"eleven" , @"11",@"twelve" , @"12", nil];
    NSDictionary *minutesWithStringRepresentation = [[NSDictionary alloc] initWithObjectsAndKeys:@"one minute", @"1", @"two minutes", @"2", @"three minutes", @"3",@"four minutes", @"4",@"five minutes", @"5",@"six minutes", @"6",@"seven minutes", @"7",@"eight minutes", @"8",@"nine minutes", @"9",@"ten minutes", @"10",@"eleven minutes", @"11",@"twelve minutes", @"12",@"thirteen minutes", @"13",@"fourteen minutes", @"14",@"fifteen minutes", @"15",@"sixteen minutes", @"16",@"seventeen minutes", @"17",@"eighteen minutes", @"18",@"nineteen minutes", @"19",@"twenty minutes", @"20",@"twenty one minutes", @"21",@"twenty two minutes", @"22",@"twenty three minutes", @"23",@"twenty four minutes", @"24",@"twenty five minutes", @"25",@"twenty six minutes", @"26",@"twenty seven minutes", @"27",@"twenty eight minutes", @"28",@"twenty nine minutes", @"29", nil];
    int hoursWithString = [hours intValue];
    int minutesWithString = [minutes intValue];
    switch (minutesWithString) {
        case 0 :
            return  [NSString stringWithFormat:@"%@ o' clock", [hoursWithStringRepresantation valueForKey:hours]];
            break;
        case 30:
            return [NSString stringWithFormat:@"half past %@", [hoursWithStringRepresantation valueForKey:hours]];
            break;
        case 15:
            return [NSString stringWithFormat:@"quarter past %@", [hoursWithStringRepresantation valueForKey:hours]];
            break;
        case 1 ... 14:
            return [NSString stringWithFormat:@"%@ past %@", [minutesWithStringRepresentation valueForKey:[NSString stringWithFormat:@"%d", [minutes intValue]]], [hoursWithStringRepresantation valueForKey: hours]];
            break;
            case 16 ... 29:
            return [NSString stringWithFormat:@"%@ past %@", [minutesWithStringRepresentation valueForKey:minutes], [hoursWithStringRepresantation valueForKey:hours]];
            break;
            case 45:
            return [NSString stringWithFormat:@"quarter to %@", [hoursWithStringRepresantation valueForKey:[NSString stringWithFormat:@"%d", hoursWithString + 1]]];
            break;
            case 46 ... 59:
            return [NSString stringWithFormat:@"%@ to %@", [minutesWithStringRepresentation valueForKey:[NSString stringWithFormat:@"%d", 60 - minutesWithString]], [hoursWithStringRepresantation valueForKey:[NSString stringWithFormat:@"%d", hoursWithString + 1]]];
            break;
            case 31 ... 44:
            return [NSString stringWithFormat:@"%@ to %@", [minutesWithStringRepresentation valueForKey:[NSString stringWithFormat:@"%d",60-[minutes intValue]]], [hoursWithStringRepresantation valueForKey:[NSString stringWithFormat:@"%d", hoursWithString + 1]]];
            break;
        default:
            return @"";
    }
    
}
@end

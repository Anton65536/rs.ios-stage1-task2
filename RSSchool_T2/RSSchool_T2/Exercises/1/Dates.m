#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    NSString *stringWithDayMonthYear = [[NSString alloc] initWithFormat:@"%@ %@ %@ ", day, month, year];
    NSDateFormatter *inDateForm = [NSDateFormatter new];
    inDateForm.dateFormat = @"dd MM yyyy";
    NSDate *inputDateFromParams = [inDateForm dateFromString:stringWithDayMonthYear];
    if(inputDateFromParams == nil){
        return @"Такого дня не существует";
    }
    NSDateFormatter *outDateForm = [NSDateFormatter new];
    outDateForm.dateFormat = @"d MMMM, EEEE";
    outDateForm.locale = [NSLocale localeWithLocaleIdentifier:@"ru_RU"];
    return [outDateForm stringFromDate:inputDateFromParams];
}

@end

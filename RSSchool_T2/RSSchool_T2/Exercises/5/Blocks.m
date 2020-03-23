#import "Blocks.h"

@implementation Blocks
 
NSArray *resultArray;

- (BlockA) blockA{
    return [^(NSArray *array){
        resultArray = array;
    } copy];
}

- (BlockB) blockB{
    return [^(Class class){
        if([class isEqual:[NSString class]]){
            NSString *finalString = @"";
            for(NSObject *buf in resultArray){
                if([buf isKindOfClass:[NSString class]]){
                    finalString = [finalString stringByAppendingString:(NSString*) buf];
                }
            }
            _blockC(finalString);
        }else if ([class isEqual:[NSNumber class]]){
            int summary = 0;
            for(NSObject *buf in resultArray){
                if([buf isKindOfClass:[NSNumber class]]){
                    int number = [(NSNumber*) buf intValue];
                    summary += number;
                }
            }
            NSNumber *summ = [[NSNumber alloc] initWithInt:summary];
            _blockC(summ);
        } else if ([class isEqual:[NSDate class]]){
            NSDate *date = [NSDate date];
            for(NSObject *buf in resultArray){
                if([buf isKindOfClass:[NSDate class]]){
                    date = [date laterDate:(NSDate*)buf];
                }
            }
            NSDateFormatter *dateF =[[NSDateFormatter alloc] init];
            dateF.dateFormat = @"dd.MM.yyy";
            _blockC([dateF stringFromDate:date]);
        }
    } copy];
}

@end


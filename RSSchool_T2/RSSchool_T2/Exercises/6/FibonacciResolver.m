#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    
    NSMutableArray *fibonacciSequence = [NSMutableArray arrayWithObjects: @0, @1, nil];
    do {
        NSNumber *nextNumber = [NSNumber numberWithInt:[fibonacciSequence[[fibonacciSequence count] - 1] intValue] + [fibonacciSequence[[fibonacciSequence count] - 2] intValue]];
        [fibonacciSequence addObject:nextNumber];
    } while ([fibonacciSequence[[fibonacciSequence count] - 1] intValue] * [fibonacciSequence[[fibonacciSequence count] - 2] intValue] < [number intValue]);
    NSNumber *trueOrFalse = [fibonacciSequence[[fibonacciSequence count] - 1] intValue] * [fibonacciSequence[[fibonacciSequence count] - 2] intValue] == [number intValue] ? @1 : @0;
    return @[fibonacciSequence[[fibonacciSequence count] - 2], fibonacciSequence[[fibonacciSequence count] - 1], trueOrFalse];
}
@end

#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    NSString *uppercaseComingStringA = [[NSString stringWithString:a] uppercaseString];
    for (int i = 0; i < [b length]; i++) {
        while (i < [uppercaseComingStringA length]) {
            if (![[uppercaseComingStringA substringWithRange:NSMakeRange(i, 1)] isEqualToString:[b substringWithRange:NSMakeRange(i, 1)]]) {
                uppercaseComingStringA = [[uppercaseComingStringA substringWithRange:NSMakeRange(0, i)] stringByAppendingString:[uppercaseComingStringA substringWithRange:NSMakeRange(i + 1, [uppercaseComingStringA length] - i - 1)]];
        }
        else{
            break;
        }
    }
}
    if ([uppercaseComingStringA length] > [b length]){
        uppercaseComingStringA = [uppercaseComingStringA substringWithRange:NSMakeRange(0, [b length])];
    }
    if ([uppercaseComingStringA isEqualToString:b]) {
        return @"YES";
    }
    return @"NO";
}
@end

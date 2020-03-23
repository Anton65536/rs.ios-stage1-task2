#import "NSString+Transform.h"

@implementation NSString (Transform)

-(NSString*)transform {
    NSCharacterSet *vowel = [NSCharacterSet characterSetWithCharactersInString:@"AEIOUYaeiouy"];
    NSCharacterSet *consonant = [NSCharacterSet characterSetWithCharactersInString:@"BCDFGHJKLMNPQRSTVWXZbcdfghjklmnpqrstvwxz"];
    NSCharacterSet *charactersToCount = [self isPangram:self] ? vowel : consonant;
    NSMutableArray *arrayFromString = [[NSMutableArray alloc] initWithArray:[self componentsSeparatedByString:@" "]];
    NSMutableArray *transformedArrayOfWords = [NSMutableArray new];
    for (NSString *initialWord in arrayFromString) {
        if (![initialWord isEqualToString:@""]) {
            NSMutableString *buffer = [[NSMutableString alloc] initWithString:initialWord];
            NSRange range = NSMakeRange(0, 1);
            int letterCount = 0;
            for (int i = 0; i < [initialWord length]; i++) {
                range.location = i;
                NSString *curLetter = [initialWord substringWithRange:range];
                if([ curLetter rangeOfCharacterFromSet:charactersToCount].location != NSNotFound){
                    [buffer replaceCharactersInRange:range withString:[curLetter uppercaseString]];
                    letterCount++;
                }
            }
            [transformedArrayOfWords addObject:[[NSString alloc] initWithFormat: @"%d%@",letterCount, buffer]];
        }
    }
    [transformedArrayOfWords sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSString *string1 = (NSString *)obj1;
        NSString *string2 = (NSString *)obj2;
        int firstDigitOfWord = [[string1 substringWithRange:NSMakeRange(0, 1)] intValue];
        int secondDigitOfWord = [[string2 substringWithRange:NSMakeRange(0, 1)] intValue];
        if (firstDigitOfWord < secondDigitOfWord) {
            return NSOrderedAscending;
        }else if (firstDigitOfWord == secondDigitOfWord){
            return NSOrderedSame;
        } else {
            return NSOrderedDescending;
        }
    }];
    
    
    return [transformedArrayOfWords componentsJoinedByString:@" "];
}

- (BOOL)isPangram:(NSString *)string {
    
    NSArray *letters = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
    
    
    NSArray *values = @[@0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0,
                      @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0];
    
    NSMutableDictionary *countCharacter = [[NSMutableDictionary alloc] initWithObjects:values forKeys:letters];
    
    NSRange range = NSMakeRange(0, 1);
    
    NSCharacterSet *lettersSet = [NSCharacterSet letterCharacterSet];
    
    
    for (int i = 0; i < [string length]; i++) {
        
        range.location = i;
        NSString *currentCharacter = [[string substringWithRange:range] uppercaseString];
        
        if ([currentCharacter rangeOfCharacterFromSet:lettersSet].location != NSNotFound) {
            
            int countCurrentCharacter = [[countCharacter objectForKey:currentCharacter] intValue] + 1;
            [countCharacter setObject:[NSNumber numberWithInt:countCurrentCharacter] forKey:currentCharacter];
        }
    }
 
    for (NSNumber *currentNumber in [countCharacter allValues]) {
        
        if ([currentNumber intValue] == 0) {
            return NO;
        }
    }
    return YES;
}


@end




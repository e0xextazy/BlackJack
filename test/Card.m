//
//  Card.m
//  test
//
//  Created by Mark Baushenko on 15/10/2019.
//  Copyright © 2019 Mark Baushenko. All rights reserved.
//

#import "Card.h"

@implementation Card

- (instancetype)init
{
    self = [super init];
    if (self) {
        _type = arc4random_uniform(12);
    }
    return self;
}

- (NSString *) name {
    switch (_type) {
        case CardTypeOne:
            return @"One";
            
        case CardTypeTwo:
            return @"Two";
            
        case CardTypeThree:
            return @"Three";
            
        case CardTypeFour:
            return @"Four";
            
        case CardTypeFive:
            return @"Five";
            
        case CardTypeSix:
            return @"Six";
            
        case CardTypeSeven:
            return @"Seven";
            
        case CardTypeEight:
            return @"Eight";
            
        case CardTypeNine:
            return @"Nine";
            
        case CardTypeTen:
            return @"Ten";
            
        case CardTypeJack:
            return @"Jack";
            
        case CardTypeQueen:
            return @"Queen";
            
        case CardTypeKing:
            return @"King";
            
        case CardTypeAce:
            return @"Ace";
    }
    @throw [[NSException alloc] init];
}

- (NSInteger) score {
    switch (_type) {
        case CardTypeOne:
            return 1;
            
        case CardTypeTwo:
            return 2;
            
        case CardTypeThree:
            return 3;
            
        case CardTypeFour:
            return 4;

        case CardTypeFive:
            return 5;
            
        case CardTypeSix:
            return 6;
            
        case CardTypeSeven:
            return 7;
            
        case CardTypeEight:
            return 8;
            
        case CardTypeNine:
            return 9;
            
        case CardTypeTen:
            return 10;

        case CardTypeJack:
            return 10;
            
        case CardTypeQueen:
            return 10;
            
        case CardTypeKing:
            return 10;
            
        case CardTypeAce:
            return 11;
    }
}

- (BOOL) isAce {
    if(_type == CardTypeAce) {
        return YES;
    }
    return NO;
}

@end

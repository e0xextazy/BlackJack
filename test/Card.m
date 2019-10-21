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
        _suit = arc4random_uniform(3);
    }
    return self;
}

- (NSString *) name {
    switch (_type) {
        case CardTypeTwo:
            return @"2";
            
        case CardTypeThree:
            return @"3";
            
        case CardTypeFour:
            return @"4";
            
        case CardTypeFive:
            return @"5";
            
        case CardTypeSix:
            return @"6";
            
        case CardTypeSeven:
            return @"7";
            
        case CardTypeEight:
            return @"8";
            
        case CardTypeNine:
            return @"9";
            
        case CardTypeTen:
            return @"10";
            
        case CardTypeJack:
            return @"J";
            
        case CardTypeQueen:
            return @"Q";
            
        case CardTypeKing:
            return @"K";
            
        case CardTypeAce:
            return @"A";
    }
    @throw [[NSException alloc] init];
}

- (NSInteger) score {
    switch (_type) {
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
    @throw [[NSException alloc] init];
}

- (NSString *) suit {
    switch (_suit) {
        case CardSuitClubs:
            return @"C";
            
        case CardSuitHearts:
            return @"H";
            
        case CardSuitSpades:
            return @"S";
            
        case CardSuitDiamonds:
            return @"D";
            
    }
    @throw [[NSException alloc] init];
}

- (BOOL) isAce {
    if(_type == CardTypeAce) {
        return YES;
    }
    return NO;
}

@end

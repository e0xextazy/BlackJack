//
//  Card.h
//  test
//
//  Created by Mark Baushenko on 15/10/2019.
//  Copyright © 2019 Mark Baushenko. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, CardType){
    CardTypeTwo,
    CardTypeThree,
    CardTypeFour,
    CardTypeFive,
    CardTypeSix,
    CardTypeSeven,
    CardTypeEight,
    CardTypeNine,
    CardTypeTen,
    CardTypeJack,
    CardTypeQueen,
    CardTypeKing,
    CardTypeAce
};

typedef NS_ENUM(NSInteger, CardSuit){
    CardSuitHearts,
    CardSuitDiamonds,
    CardSuitClubs,
    CardSuitSpades
};

@interface Card : NSObject {
    CardType _type;
    CardSuit _suit;
}
- (NSString *) name;
- (NSString *) suit;
- (NSInteger) score;

- (BOOL) isAce;

@end

NS_ASSUME_NONNULL_END

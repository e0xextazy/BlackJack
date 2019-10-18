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
    CardTypeOne,
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

@interface Card : NSObject {
    CardType _type;
}
//@property (nonatomic, assign) CardType type; (вместо фигурных скобок выше)
- (NSString *) name;
- (NSInteger) score;

- (BOOL) isAce;

@end

NS_ASSUME_NONNULL_END

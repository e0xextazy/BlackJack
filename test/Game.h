//
//  Game.h
//  test
//
//  Created by Mark Baushenko on 15/10/2019.
//  Copyright © 2019 Mark Baushenko. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Game : NSObject

@property NSMutableArray * myCards;
@property NSMutableArray * dealerCards;

- (void) startGame;

- (void) hitMe;
- (BOOL) hitDealer;

- (BOOL) iHaveBlackJack;
- (BOOL) dealerhasBlackJack;

- (BOOL) iHaveMore;
- (BOOL) dealerHasMore;

- (BOOL) scoreEqual;
- (BOOL) iHaveHigherScore;

- (void) printMy;
- (void) printDealer;

@end

NS_ASSUME_NONNULL_END

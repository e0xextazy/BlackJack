//
//  Game.m
//  test
//
//  Created by Mark Baushenko on 15/10/2019.
//  Copyright © 2019 Mark Baushenko. All rights reserved.
//

#import "Game.h"
#import "Card.h"
#import "NSArray+Card.h"

@interface Game () //Расширение
- (NSString *) getCardNames:(NSArray *)cards;
- (NSInteger) calcScoreFor:(NSArray *)cards;
@end

@implementation Game

- (instancetype)init
{
    self = [super init];
    if (self) {
        _myCards = [NSMutableArray new];
        _dealerCards = [NSMutableArray new];
    }
    return self;
}

- (void) startGame {
    Card * card1 = [[Card alloc] init];
    Card * card2 = [[Card alloc] init];
    [_myCards addObjectsFromArray:@[card1, card2]];
    
    [_dealerCards addObject:[[Card alloc] init]];
    
    [self printMy];
    [self printDealer];
}

- (void) hitMe {
    [self.myCards addObject:[[Card alloc] init]];
}
    
- (BOOL) hitDealer {
    NSInteger dealerScore = [self calcScoreFor:self.dealerCards];
    if (dealerScore > 17) {
        return NO;
    }
    [self.dealerCards addObject:[[Card alloc] init]];
    return YES;
}

- (BOOL) iHaveBlackJack {
    NSInteger myScore = [self calcScoreFor:self.myCards];
    if (myScore == 21) {
        return YES;
    }
    return NO;
}

- (BOOL) dealerhasBlackJack {
    NSInteger dealerScore = [self calcScoreFor:self.dealerCards];
    if (dealerScore == 21) {
        return YES;
    }
    return NO;
}

- (BOOL) iHaveHigherScore {
    //NSInteger dealerScore = [self calcScoreFor:self.dealerCards];
    NSInteger dealerScore = [self.dealerCards calcScore]; // Можно и так и так как выше
    NSInteger myScore = [self calcScoreFor:self.myCards];
    if (dealerScore < myScore) {
        return YES;
    }
    return NO;
}

- (BOOL) iHaveMore {
    NSInteger myScore = [self calcScoreFor:self.myCards];
    if (myScore > 21) {
        return YES;
    }
    return NO;
}

- (BOOL) dealerHasMore {
    NSInteger dealerScore = [self calcScoreFor:self.dealerCards];
    if (dealerScore > 21) {
        return YES;
    }
    return NO;
}

- (BOOL) scoreEqual {
    NSInteger dealerScore = [self calcScoreFor:self.dealerCards];
    NSInteger myScore = [self calcScoreFor:self.myCards];
    if (dealerScore == myScore) {
        return YES;
    }
    return NO;
}

- (void) printMy {
    NSLog(@"You have: %@", [self getCardNames:self.myCards]);
}

- (void) printDealer {
    NSLog(@"Dealer has: %@", [self getCardNames:self.dealerCards]);
}

- (NSString *) getCardNames:(NSArray *)cards {
    /*NSMutableString * cardNames = [[NSMutableString alloc] init];
    for (Card * card in cards) {
        [cardNames appendString:[card name]];
        [cardNames appendString:@" "];
    }
    return cardNames;*/
    return [cards getCardNames];
}

- (NSInteger) calcScoreFor:(NSArray *)cards {
    /*NSInteger score = 0;
    NSInteger aceCount = 0;
    for (Card * card in cards) {
        score += [card score];
        if([card isAce]) {
            aceCount++;
        }
    }
    while (aceCount > 0 && score > 21) {
        score -= 10;
        aceCount--;
    }
    return score;*/
    return [cards calcScore];
}

@end

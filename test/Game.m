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
        _busyCards = [NSMutableArray new];
    }
    return self;
}

- (void) startGame {
    Card * card1 = [[Card alloc] init];
    [_busyCards addObject:card1];
    [_myCards addObject:card1];
    Card * card2 = [[Card alloc] init];
    while ([_busyCards containsObject:card2]) {
        card2 = [[Card alloc] init];
    }
    [_busyCards addObject:card2];
    [_myCards addObject:card2];
    Card * card3 = [[Card alloc] init];
    while ([_busyCards containsObject:card3]) {
        card3 = [[Card alloc] init];
    }
    [_dealerCards addObject:card3];
    [self printMy];
    [self printDealer];
}

- (void) hitMe {
    Card * card = [[Card alloc] init];
    while ([_busyCards containsObject:card]) {
        card = [[Card alloc] init];
    }
    [_busyCards addObject:card];
    [_myCards addObject:card];
}
    
- (BOOL) hitDealer {
    NSInteger dealerScore = [self calcScoreFor:self.dealerCards];
    if (dealerScore > 17) {
        return NO;
    }
    Card * card = [[Card alloc] init];
    while ([_busyCards containsObject:card]) {
        card = [[Card alloc] init];
    }
    [_busyCards addObject:card];
    [_dealerCards addObject:card];
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
    NSInteger dealerScore = [self.dealerCards calcScore];
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
    return [cards getCardNames];
}

- (NSInteger) calcScoreFor:(NSArray *)cards {
    return [cards calcScore];
}

@end

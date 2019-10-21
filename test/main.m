//
//  main.m
//  test
//
//  Created by Mark Baushenko on 15/10/2019.
//  Copyright © 2019 Mark Baushenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"
#import "Card.h"

NSString * getInput() {
    NSFileHandle * input = NSFileHandle.fileHandleWithStandardInput;
    NSData * data = input.availableData;
    return [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet controlCharacterSet]];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Welcome to BlackJack!");
        BOOL stopGame = NO;
        while (!stopGame) {
            Game * game = [Game new];
            [game startGame];
            if ([game iHaveBlackJack]) {
                NSLog(@"You have BlackJack!");
                break;
            }
            BOOL result = YES;
            while (result) {
                NSLog(@"Deal new card? y/n");
                NSString * str = getInput();
                if ([str isEqualToString:@"y"]) {
                    [game hitMe];
                    [game printMy];
                    if ([game iHaveBlackJack]) {
                        NSLog(@"You have BlackJack!");
                        break;
                    }
                    if ([game iHaveMore]) {
                        NSLog(@"you Busted!");
                        break;
                    }
                }
                if ([str isEqualToString:@"n"]) {
                    BOOL dealerTookCard = [game hitDealer];
                    if (dealerTookCard) {
                        [game printDealer];
                        if ([game dealerhasBlackJack]) {
                            NSLog(@"You Busted!");
                            break;
                        }
                        if ([game dealerHasMore]) {
                            NSLog(@"You Won!");
                            break;
                        }
                    } else {
                        if ([game scoreEqual]) {
                            NSLog(@"Same score!");
                        }
                        if ([game iHaveHigherScore]) {
                            NSLog(@"You Won!");
                            break;
                        } else {
                            NSLog(@"You Busted!");
                            break;
                        }
                    }
                }
            }
            NSLog(@"Do u want play a new game? y/n");
            NSString * solution = getInput();
            if ([solution isEqualToString:@"n"]) {
                stopGame = YES;
            }
            NSLog(@"Game ended!");
        } // end while
    }
    return 0;
}

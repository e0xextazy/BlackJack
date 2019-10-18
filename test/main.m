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
        // insert code here...
        NSLog(@"Welcome to BlackJack!");
        
        Game * game = [Game new];
        [game startGame];
        
        if ([game iHaveBlackJack]) {
            NSLog(@"You have BlackJack!");
            return 0;
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
                    return 0;
                }
                
                if ([game iHaveMore]) {
                    NSLog(@"you Busted!");
                    return 0;
                }
            }
            
            if ([str isEqualToString:@"n"]) {
                BOOL dealerTookCard = [game hitDealer];
                
                if (dealerTookCard) {
                    [game printDealer];
                    
                    if ([game dealerhasBlackJack]) {
                        NSLog(@"You Busted!");
                        return 0;
                    }
                    
                    if ([game dealerHasMore]) {
                        NSLog(@"You Won!");
                        return 0;
                    }
                } else {
                    if ([game scoreEqual]) {
                        NSLog(@"Same score!");
                    }
                    
                    if ([game iHaveHigherScore]) {
                        NSLog(@"You Won!");
                        return 0;
                    } else {
                        NSLog(@"You Busted!");
                        return 0;
                    }
                }
            }
        }
        NSLog(@"Game ended!");
    }
    return 0;
}

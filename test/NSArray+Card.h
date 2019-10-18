//
//  NSArray+Card.h
//  test
//
//  Created by Mark Baushenko on 17/10/2019.
//  Copyright © 2019 Mark Baushenko. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Card) // Категория и 2 новых метода
- (NSString *) getCardNames;
- (NSInteger) calcScore;
@end

NS_ASSUME_NONNULL_END

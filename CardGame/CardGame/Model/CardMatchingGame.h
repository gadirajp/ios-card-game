//
//  CardMatchingGame.h
//  CardGame
//
//  Created by Praneeth Gadiraju on 2/11/14.
//  Copyright (c) 2014 Praneeth Gadiraju. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject


//designated initializer
- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
- (void) chooseCardAtIndex:(NSUInteger) index forMode:(NSInteger) modeNumber;
- (Card *)cardAtIndex:(NSUInteger) index;

@property (nonatomic, readonly) NSInteger score;

@end

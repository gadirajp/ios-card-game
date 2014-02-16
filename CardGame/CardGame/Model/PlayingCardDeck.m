//
//  PlayingCardDeck.m
//  CardGame
//
//  Created by Praneeth Gadiraju on 2/9/14.
//  Copyright (c) 2014 Praneeth Gadiraju. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype) init {
    self = [super init];
    if(self){
        for(NSString *suit in [PlayingCard validSuits]){
            for(NSUInteger rank = 1; rank <= [PlayingCard maxRank];
                rank++){
                PlayingCard *card = [[PlayingCard alloc] init];
                card.suit = suit;
                card.rank = rank;
                [self addCard:card];
            }
        }
        
    }
    return self;
}

@end

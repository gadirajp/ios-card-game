//
//  CardMatchingGame.m
//  CardGame
//
//  Created by Praneeth Gadiraju on 2/11/14.
//  Copyright (c) 2014 Praneeth Gadiraju. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of card
@property (nonatomic, strong) NSMutableArray *chosenCards;
@end

@implementation CardMatchingGame

- (NSMutableArray *) cards{
    if(!_cards){
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (NSMutableArray *) chosenCards{
    if(!_chosenCards){
        _chosenCards = [[NSMutableArray alloc] init];
    }
    return _chosenCards;
}

-(instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    self = [super init];
    if(self){
        for(int i = 0;i < count;i++){
            Card *card = [deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
            
        }
    }
    return self;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void) chooseCardAtIndex:(NSUInteger)index forMode:(NSInteger)modeNumber{
    
        Card *card = [self cardAtIndex:index];
        if(!card.isMatched){
            if(card.isChosen){
                card.chosen = NO;
            }else{
                [self.chosenCards addObject:card];
                if([self.chosenCards count] == modeNumber){
                    int matchScore = 0;
                    for(int i = 1; i < modeNumber; i++){
                        NSMutableArray *tempArray = [[NSMutableArray alloc] init];
                        for(int j = 0; j < i; j++ ){
                            [tempArray addObject:self.chosenCards[j]];
                        }
                        matchScore += [self.chosenCards[i] match:tempArray];
                    }
                    if(matchScore){
                        self.score +=matchScore * MATCH_BONUS;
                        [self setChosenCardsToMatched];
                    }else{
                        self.score -= MISMATCH_PENALTY;
                        [self setChosenCardsToNotChosen];
                        [self.chosenCards addObject:card];
                    }
                }
                self.score -= COST_TO_CHOOSE;
                card.chosen = YES;
            }
        }
    
    
}

- (void) setChosenCardsToMatched{
    for (Card *chosenCard in self.chosenCards){
        chosenCard.matched = YES;
    }
    [self emptyChosenCards];
}

- (void) setChosenCardsToNotChosen{
    for(Card *card in self.chosenCards){
        card.chosen = NO;
    }
    [self emptyChosenCards];
}

- (void) emptyChosenCards{
    self.chosenCards = nil;
}

- (Card *) cardAtIndex:(NSUInteger)index{
    return index < [self.cards count]? self.cards[index] : nil;
}

@end

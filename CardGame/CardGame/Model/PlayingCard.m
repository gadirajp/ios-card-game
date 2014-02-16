//
//  PlayingCard.m
//  CardGame
//
//  Created by Praneeth Gadiraju on 2/9/14.
//  Copyright (c) 2014 Praneeth Gadiraju. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int) match:(NSArray *)otherCards{
    int score = 0;
    for(PlayingCard *playingCard in otherCards){
        score += [self matchEachCard:playingCard];
    }
        return score;
}

- (int) matchEachCard: (PlayingCard *)otherCard{
    int tempScore = 0;
        if(otherCard.rank == self.rank){
            tempScore = 4;
        }else if([otherCard.suit isEqualToString:self.suit]){
            tempScore = 1;
        }
    return tempScore;
}

- (NSString *) contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

+ (NSArray *) validSuits{
    return @[@"♣︎",@"♦︎",@"♥︎",@"♠︎"];
}

+ (NSArray *) rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",
             @"10",@"J",@"Q",@"K"];
}


- (void) setSuit:(NSString *)suit
{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

- (NSString *)getSuit
{
    return _suit?_suit:@"?";
}

+ (NSUInteger) maxRank{
    return [[self rankStrings] count]-1;
}

- (void) setRank:(NSUInteger)rank{
    if(rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}



@end

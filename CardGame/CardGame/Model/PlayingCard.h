//
//  PlayingCard.h
//  CardGame
//
//  Created by Praneeth Gadiraju on 2/9/14.
//  Copyright (c) 2014 Praneeth Gadiraju. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic, getter = getSuit) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSUInteger) maxRank;

@end

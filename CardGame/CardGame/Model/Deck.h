//
//  Deck.h
//  CardGame
//
//  Created by Praneeth Gadiraju on 2/9/14.
//  Copyright (c) 2014 Praneeth Gadiraju. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void) addCard:(Card *)card atTop:(BOOL *)atTop;
- (void) addCard:(Card *)card;

- (Card *) drawRandomCard;

@end

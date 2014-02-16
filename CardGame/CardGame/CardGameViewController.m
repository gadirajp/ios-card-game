//
//  CardGameViewController.m
//  CardGame
//
//  Created by Praneeth Gadiraju on 2/8/14.
//  Copyright (c) 2014 Praneeth Gadiraju. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControlForMode;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *gameModeLabel;
@property (nonatomic) NSInteger selectedCardModeIndex;
@end

@implementation CardGameViewController

- (CardMatchingGame *)game{
    if(!_game){
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                 usingDeck:[self createDeck]];
    }
    return _game;
}
- (Deck *)deck{
    if(!_deck){
        _deck = [self createDeck];
    }
    return _deck;
}

- (NSInteger) selectedCardModeIndex{
    if(!_selectedCardModeIndex){
        _selectedCardModeIndex = 2;
    }
    return _selectedCardModeIndex;
}

- (Deck *) createDeck{
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)touchCardDown:(UIButton *)sender {
    if(self.segmentedControlForMode.enabled){
        self.segmentedControlForMode.enabled = NO;
    }
    int choosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:choosenButtonIndex forMode:self.selectedCardModeIndex];
    [self updateUI];
    
}

- (IBAction)gameModeChanged:(UISegmentedControl *)sender {
    if(sender.selectedSegmentIndex == 1){
        self.gameModeLabel.text = @"3 card mode";
        self.selectedCardModeIndex = 3;
    }else{
        self.gameModeLabel.text = @"2 card mode";
        self.selectedCardModeIndex = 2;
    }
}

- (IBAction)dealCards:(id)sender {
    self.game = nil;
    if(!self.segmentedControlForMode.enabled){
        self.segmentedControlForMode.enabled = YES;
    }
    [self updateUI];
                 
}

- (void) updateUI{
    for(UIButton *cardButton in self.cardButtons){
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self imageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"%d",self.game.score];
        
    }
    
}

- (NSString *) titleForCard: (Card *)card{
    return card.isChosen?card.contents:@"";
}

- (UIImage *) imageForCard : (Card *) card{
    return [UIImage imageNamed:card.isChosen?@"imageFront":@"imageBack"];
}

@end

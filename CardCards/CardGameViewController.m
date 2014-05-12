//
//  CardGameViewController.m
//  CardCards
//
//  Created by Eddie Chan on 14-5-8.
//  Copyright (c) 2014年 blast Workshop. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (nonatomic) PlayingCardDeck *cardDeck;

@end

@implementation CardGameViewController

-(PlayingCardDeck *) cardDeck
{
    if(!_cardDeck) _cardDeck = [[PlayingCardDeck alloc] init];
    return _cardDeck;
}

-(void) setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    
//    NSLog(@"Flip change to %d", self.flipCount);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    UIColor *newColor = nil;
    if ([sender.currentTitle length]) {
        newColor = [UIColor blackColor];
        [sender setTitle:@"" forState:UIControlStateNormal];
        [sender setBackgroundColor:newColor];
    } else {
        if([self.cardDeck countOfCards])
        {
            newColor = [UIColor whiteColor];
            [sender setTitle:[[self.cardDeck drawRandomCard] contents] forState:UIControlStateNormal];
            [sender setBackgroundColor:newColor];
            self.flipCount++;
        }
    }
}

@end

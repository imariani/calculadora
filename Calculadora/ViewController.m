//
//  ViewController.m
//  Calculadora
//
//  Created by ignacio mariani on 22/6/17.
//  Copyright © 2017 ignacio mariani. All rights reserved.
//

#import "ViewController.h"
#import "CLConstants.h"
#import "CLCalculator.h"

@interface ViewController () <CalculatorResultDelegate>

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (assign, nonatomic) NSUInteger firstValue;
@property (assign, nonatomic) NSUInteger secondValue;
@property (assign, nonatomic) BOOL actionSelected;
@property (strong, nonatomic) NSString *action;

@property (strong, nonatomic) CLCalculator *calculator;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.actionSelected = NO;
    
    self.calculator = [[CLCalculator alloc] init];
    [self.calculator setNewDelegate:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)writeNumberInBox:(NSString *)number
{
    NSString *actualNumber = self.resultLabel.text;
    
    if ([actualNumber isEqualToString:@"0"] || self.actionSelected)
    {
        self.resultLabel.text = number;
        self.actionSelected = NO;
    }
    else
    {
        self.resultLabel.text = [NSString stringWithFormat:@"%@%@", self.resultLabel.text, number];
    }
}

- (IBAction)cButtonPressed:(id)sender
{
    [self resetAll];
}

- (IBAction)ceroButtonPressed:(id)sender
{
    [self writeNumberInBox:@"0"];
}

- (IBAction)oneButtonPressed:(id)sender
{
    [self writeNumberInBox:@"1"];
}

- (IBAction)twoButtonPressed:(id)sender
{
    [self writeNumberInBox:@"2"];
}

- (IBAction)threeButtonPressed:(id)sender
{
    [self writeNumberInBox:@"3"];
}

- (IBAction)fourButtonPressed:(id)sender
{
    [self writeNumberInBox:@"4"];
}

- (IBAction)fiveButtonPressed:(id)sender
{
    [self writeNumberInBox:@"5"];
}

- (IBAction)sixButtonPressed:(id)sender
{
    [self writeNumberInBox:@"6"];
}

- (IBAction)sevenButtonPressed:(id)sender
{
    [self writeNumberInBox:@"7"];
}

- (IBAction)eightButtonPressed:(id)sender
{
    [self writeNumberInBox:@"8"];
}

- (IBAction)nineButtonPressed:(id)sender
{
    [self writeNumberInBox:@"9"];
}

- (IBAction)sumButtonPressed:(id)sender
{
    self.action = kSumAction;
    [self saveFirstValue];
}

- (IBAction)resButtonPressed:(id)sender
{
    self.action = kResAction;
    [self saveFirstValue];
}

- (IBAction)mulButtonPressed:(id)sender
{
    self.action = kMulAction;
    [self saveFirstValue];
}

- (IBAction)divButtonPressed:(id)sender
{
    self.action = kDivAction;
    [self saveFirstValue];
}

- (IBAction)percentButtonPressed:(id)sender
{
    self.actionSelected = YES;
    [self.calculator calculatePercentFromValue:[self.resultLabel.text floatValue]];
}


- (IBAction)equalButtonPressed:(id)sender
{
    self.secondValue = [self.resultLabel.text intValue];
    
    [self.calculator calculateAction:self.action forFirstValue:self.firstValue andSecondValue:self.secondValue];
}

- (void)saveFirstValue
{
    self.actionSelected = YES;
    self.firstValue = [self.resultLabel.text intValue];
}

- (void)resetAll
{
    self.firstValue = 0;
    self.secondValue = 0;
    self.resultLabel.text = @"0";
    self.action = @"";
    self.actionSelected = NO;
}

#pragma mark - Notifications

- (void)notifyResult:(NSString *)result
{
    self.resultLabel.text = result;
    self.actionSelected = NO;
    self.action = @"";
}





@end

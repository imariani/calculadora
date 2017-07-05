//
//  CLCalculator.m
//  Calculadora
//
//  Created by ignacio mariani on 23/6/17.
//  Copyright © 2017 ignacio mariani. All rights reserved.
//

#import "CLCalculator.h"
#import "CLConstants.h"

@interface CLCalculator ()

@property (strong, nonatomic) NSString *resultString;

@end


@implementation CLCalculator

- (void)calculateAction:(NSString *)action forFirstValue:(NSUInteger)firstValue andSecondValue:(NSUInteger)secondValue
{    
    if ([action isEqualToString:kSumAction])
    {
        NSUInteger result = firstValue + secondValue;
        self.resultString = [NSString stringWithFormat:@"%lu", (unsigned long)result];
    }
    else if ([action isEqualToString:kResAction])
    {
        NSInteger result = firstValue - secondValue;
        self.resultString = [NSString stringWithFormat:@"%ld", (long)result];
    }
    else if ([action isEqualToString:kMulAction])
    {
        NSUInteger result = firstValue * secondValue;
        self.resultString = [NSString stringWithFormat:@"%lu", (unsigned long)result];
    }
    else if ([action isEqualToString:kDivAction])
    {
        float result = (float)firstValue / (float)secondValue;
        self.resultString = [self formatDecimalFromFloat:result];
    }
    
    [self.delegate notifyResult:self.resultString];
}

- (void)calculatePercentFromValue:(float)value
{
    float result = value/100;
    self.resultString = [self formatDecimalFromFloat:result];
    [self.delegate notifyResult:self.resultString];
}

- (NSString *)formatDecimalFromFloat:(float)resFloat
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.maximumFractionDigits = 5;
    
    NSString *result = [formatter stringFromNumber:@(resFloat)];
    
    return result;
}

#pragma mark - setDelegate

- (void) setNewDelegate:(id)newDelegate
{
    self.delegate = newDelegate;
}

@end

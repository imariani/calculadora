//
//  CLCalculator.h
//  Calculadora
//
//  Created by ignacio mariani on 23/6/17.
//  Copyright © 2017 ignacio mariani. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CalculatorResultDelegate <NSObject>

-(void)notifyResult:(NSString *)result;

@end

@interface CLCalculator : NSObject

@property (strong, nonatomic) id<CalculatorResultDelegate> delegate;

- (void)calculateAction:(NSString *)action forFirstValue:(NSUInteger)firstValue andSecondValue:(NSUInteger)secondValue;
- (void)calculatePercentFromValue:(float)value;
- (void)setNewDelegate:(id)newDelegate;

@end

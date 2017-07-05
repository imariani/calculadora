//
//  CalculadoraTests.m
//  CalculadoraTests
//
//  Created by ignacio mariani on 22/6/17.
//  Copyright © 2017 ignacio mariani. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CLCalculator.h"
#import "CLConstants.h"

@interface CLCalculator (Testing)

@property (strong, nonatomic) NSString *resultString;
- (void)calculateAction:(NSString *)action forFirstValue:(NSUInteger)firstValue andSecondValue:(NSUInteger)secondValue;
- (void)calculatePercentFromValue:(float)value;

@end

@interface CalculadoraTests : XCTestCase

@property CLCalculator *calculator;

@end

@implementation CalculadoraTests

- (void)setUp {
    [super setUp];

    _calculator = [[CLCalculator alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSumA
{
    NSString *expectedResult = @"20";
    
    [self.calculator calculateAction:kSumAction forFirstValue:15 andSecondValue:5];
    NSString *resultString = self.calculator.resultString;
    
    XCTAssertEqualObjects(expectedResult, resultString);
}

- (void)testSumB
{
    NSString *expectedResult = @"32";
    
    [self.calculator calculateAction:kSumAction forFirstValue:16 andSecondValue:16];
    NSString *resultString = self.calculator.resultString;
    
    XCTAssertEqualObjects(expectedResult, resultString);
}

- (void)testResA
{
    NSString *expectedResult = @"10";
    
    [self.calculator calculateAction:kResAction forFirstValue:25 andSecondValue:15];
    NSString *resultString = self.calculator.resultString;
    
    XCTAssertEqualObjects(expectedResult, resultString);
}

- (void)testResB
{
    NSString *expectedResult = @"-30";
    
    [self.calculator calculateAction:kResAction forFirstValue:30 andSecondValue:60];
    NSString *resultString = self.calculator.resultString;
    
    XCTAssertEqualObjects(expectedResult, resultString);
}

- (void)testMulA
{
    NSString *expectedResult = @"6";
    
    [self.calculator calculateAction:kMulAction forFirstValue:3 andSecondValue:2];
    NSString *resultString = self.calculator.resultString;
    
    XCTAssertEqualObjects(expectedResult, resultString);
}

- (void)testMulB
{
    NSString *expectedResult = @"192";
    
    [self.calculator calculateAction:kMulAction forFirstValue:6 andSecondValue:32];
    NSString *resultString = self.calculator.resultString;
    
    XCTAssertEqualObjects(expectedResult, resultString);
}

- (void)testDivA
{
    NSString *expectedResult = @"2";
    
    [self.calculator calculateAction:kDivAction forFirstValue:20 andSecondValue:10];
    NSString *resultString = self.calculator.resultString;
    
    XCTAssertEqualObjects(expectedResult, resultString);
}

- (void)testDivB
{
    NSString *expectedResult = @"0.5";
    
    [self.calculator calculateAction:kDivAction forFirstValue:1 andSecondValue:2];
    NSString *resultString = self.calculator.resultString;
    
    XCTAssertEqualObjects(expectedResult, resultString);
}

- (void)testPercentA
{
    NSString *expectedResult = @"0.43";
    
    [self.calculator calculatePercentFromValue:43];
    NSString *resultString = self.calculator.resultString;
    
    XCTAssertEqualObjects(expectedResult, resultString);
}

- (void)testPercentB
{
    NSString *expectedResult = @"1";
    
    [self.calculator calculatePercentFromValue:100];
    NSString *resultString = self.calculator.resultString;
    
    XCTAssertEqualObjects(expectedResult, resultString);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

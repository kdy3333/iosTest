//
//  Calculator.m
//  ObjC
//
//  Created by MF839-005 on 2016. 6. 14..
//  Copyright © 2016년 MF839-005. All rights reserved.
//

#import "Calculator.h"
@implementation Calculator
-(id) init
{
    self = [super init];
    
    if(self){
        _operand1 = [[Fraction alloc]init];
        _operand2 = [[Fraction alloc]init];
        _accumulator = [[Fraction alloc]init];
    }
    return self;
}

-(Fraction *) performOperation:(char)op
{
    Fraction *result;
    
    switch (op) {
        case '+':
            result = [_operand1 add: _operand2];
            break;
        case '-':
            result = [_operand1 sub: _operand2];
            break;
        case '*':
            result = [_operand1 mul: _operand2];
            break;
        case '/':
            result = [_operand1 div: _operand2];
            break;
        default:
            break;
    }
    
    _accumulator.numerator = result.numerator;
    _accumulator.denominator = result.denominator;
    
    return _accumulator;
}
-(void) clear
{
    _accumulator.numerator = 0;
    _accumulator.denominator = 0;
}


@end

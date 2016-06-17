//
//  ViewController.m
//  Calculator
//
//  Created by MF839-005 on 2016. 6. 15..
//  Copyright © 2016년 MF839-005. All rights reserved.
//

#import "ViewController.h"
#import "Fraction.h"
#import "Calculator.h"
#import "InfoViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    char op;
    int flag;
    int currentNumber;
    BOOL firstOperand, isNumerator;
    Calculator *myCalculator;
    NSMutableString *displayString;
    
}

@synthesize display;

- (void)viewDidLoad {
    display.text = @"";
    firstOperand = YES;
    isNumerator = YES;
    displayString = [NSMutableString stringWithCapacity:40];
    myCalculator = [[Calculator alloc]init];
    
  //  if(firstOperand)
 //     self.show.enabled = NO;
}

- (void) processDigit:(int)digit
{
    currentNumber = currentNumber * 10 +digit;
    
    [displayString appendString:[NSString stringWithFormat:@"%i", digit]];
    display.text = displayString;
}

-(void) setButtonEnabled:(BOOL)val{
    for(int i = 0; i<self.show2.count ; i++){
        UIButton *btn = [self.show2 objectAtIndex:i];
        btn.hidden = val;
    }
}
-(void)processOp:(char)theOp
{
    NSString *opStr;
    op=theOp;
    
    switch (theOp) {
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" - ";
            break;
        case '*':
            opStr = @" * ";
            break;
        case '/':
            opStr = @" / ";
            break;
    }
    [self storeFracPart];
    firstOperand = NO;
    isNumerator = YES;
    [self setButtonEnabled:YES];
    [displayString appendString:opStr];
    display.text = displayString;
}

-(void)storeFracPart
{
    if(firstOperand){
        if(isNumerator){
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand2.denominator = 1;
        }
        else
            myCalculator.operand1.denominator = currentNumber;
    }
    else if (isNumerator){
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator =1;
        
    }
    else{
        myCalculator.operand2.denominator = currentNumber;
        firstOperand = YES;
        
   //     [self clickEquals];
    }
    currentNumber =0;
        
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickPlus:(id)sender {
    [self processOp:'+'];
}

- (IBAction)clickMinus:(id)sender {
    [self processOp:'-'];
}

- (IBAction)clickMultiply:(id)sender {
    [self processOp:'*'];
}

- (IBAction)clickDivide:(id)sender {
    [self processOp:'/'];
}
- (IBAction)clickOver:(id)sender {
    [self storeFracPart];
    isNumerator = NO;
    [displayString appendString:@"/"];
    display.text = displayString;
}

- (IBAction)clickEquals:(id)sender {
    if(firstOperand == NO){
        [self storeFracPart];
        [myCalculator performOperation:op];
        
        [displayString appendString: @" = "];
        [displayString appendString: [myCalculator.accumulator convertToString]];
        display.text = displayString;
        
        currentNumber = 0;
        isNumerator = YES;
        firstOperand = YES;
        [self setButtonEnabled:NO];
        [displayString setString:@""];
    }
}

- (IBAction)clickClear:(id)sender {
    isNumerator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];
    
    [displayString setString:@""];
    display.text = displayString;
}
- (IBAction)clickDigit:(UIButton *)sender {
    int digit = sender.tag;
    [self processDigit:digit];
}
- (IBAction)openInfoView:(id)sender {
    InfoViewController *infoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"infoview"];
    
    infoViewController.delegate = self;
    
    infoViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    infoViewController.myString = self.display.text;
    
    [self presentViewController:infoViewController animated:YES completion:nil];
}

- (IBAction)openview2:(id)sender {
    [self performSegueWithIdentifier:@"view2" sender:self];
}

- (IBAction)unwindToViewController:(UIStoryboardSegue*)sender
{
    NSLog(@"unwindtoviewController");
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"segue ID = %@", segue.identifier);
    if([segue.identifier isEqualToString:@"view2"])
    {
        InfoViewController *infoview = [segue destinationViewController];
        
       infoview.myString = @"Hello!!!!";
    }
}

-(void) changeColor:(UIColor*) newColor
{
    [self.view setBackgroundColor:newColor];
    NSLog(@"change color");
}
@end

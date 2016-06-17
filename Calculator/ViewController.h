//
//  ViewController.h
//  Calculator
//
//  Created by MF839-005 on 2016. 6. 15..
//  Copyright © 2016년 MF839-005. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoViewController.h"

@interface ViewController : UIViewController <InfoViewProtocol>

@property (weak, nonatomic) IBOutlet UILabel *display;

-(void)processDigit:(int)digit;
-(void)processOp:(char)theOp;
-(void)storeFracPart;

- (IBAction)clickDigit:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *show;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *show2;

- (IBAction)openInfoView:(id)sender;
- (IBAction)openview2:(id)sender;
- (IBAction)unwindToViewController:(UIStoryboardSegue*)sender;

//산술 연산키
- (IBAction)clickPlus:(id)sender;
- (IBAction)clickMinus:(id)sender;
- (IBAction)clickMultiply:(id)sender;
- (IBAction)clickDivide:(id)sender;

//기타 키
- (IBAction)clickOver:(id)sender;
- (IBAction)clickEquals:(id)sender;
- (IBAction)clickClear:(id)sender;

-(void) changeColor:(UIColor*) newColor;

@end


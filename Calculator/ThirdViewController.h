//
//  ThirdViewController.h
//  Calculator
//
//  Created by MF839-005 on 2016. 6. 17..
//  Copyright © 2016년 MF839-005. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController
{
    void(^changeMainBackColor)(UIColor*);
}
- (IBAction)changeColor2:(id)sender;
-(void) changeColorFunc:(void(^)(UIColor*))myFunc;

@end

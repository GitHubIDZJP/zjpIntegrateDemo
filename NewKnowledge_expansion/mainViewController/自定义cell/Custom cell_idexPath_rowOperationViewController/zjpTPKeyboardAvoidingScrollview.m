//
//  zjpTPKeyboardAvoidingScrollview.m
//  NewKnowledge_expansion
//
//  Created by mac on 2018/4/14.
//  Copyright © 2018年 吴雪梅老师QQ:1377583010. All rights reserved.
//

#import "zjpTPKeyboardAvoidingScrollview.h"

@interface zjpTPKeyboardAvoidingScrollview ()
//把UIScrollview改为TPKeyboardAvoidingScrollview就行
@property (weak, nonatomic) IBOutlet TPKeyboardAvoidingScrollView *zjpScrollview;

@end

@implementation zjpTPKeyboardAvoidingScrollview

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGFloat W = [UIScreen mainScreen].bounds.size.width;
    CGFloat H = [UIScreen mainScreen].bounds.size.height;
    
    UITextField *textF= [[UITextField alloc]initWithFrame:CGRectMake(W/2-150, H-50, 300, 30)];
    textF.layer.borderWidth = 5;
    textF.borderStyle = UITextBorderStyleRoundedRect;
    textF.layer.borderColor = [UIColor redColor].CGColor;
    
    [_zjpScrollview addSubview:textF];
    [_zjpScrollview setContentSize:CGSizeMake(W, H)];
    
    
    
}



@end

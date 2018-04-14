//
//  SeekViewController.m
//  NewKnowledge_expansion
//
//  Created by mac on 2018/4/12.
//  Copyright © 2018年 吴雪梅老师QQ:1377583010. All rights reserved.
//

#import "SeekViewController.h"

@interface SeekViewController ()<XSpotLightDelegate>

@end

@implementation SeekViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)viewDidAppear:(BOOL)animated{
    
    
        XSpotLight *SpotLight = [[XSpotLight alloc]init];
        SpotLight.messageArray = @[
                                   @"hello,大家好",
                                   @"点这里撰写文章",
                                   @"搜索文章",
                                   @"结束"
                                   ];
        SpotLight.rectArray = @[
                                [NSValue valueWithCGRect:CGRectMake(0,0,0,0)],
                                [NSValue valueWithCGRect:CGRectMake(SCREEN_WIDTH/2, SCREEN_HEIGHT - 20, 50, 500)],
                                [NSValue valueWithCGRect:CGRectMake(SCREEN_WIDTH - 20, 42, 50, 500)],
                                [NSValue valueWithCGRect:CGRectMake(0,0,0,0)]
                                ];
    
        SpotLight.delegate = self;
        [self presentViewController:SpotLight animated:false completion:^{
    
        }];
}
-(void)XSpotLightClicked:(NSInteger)index{
    NSLog(@"%ld",(long)index);
}
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [self  dismissViewControllerAnimated:YES completion:nil];
//}
@end

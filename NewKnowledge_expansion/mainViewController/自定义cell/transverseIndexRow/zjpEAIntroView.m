//
//  zjpEAIntroView.m
//  NewKnowledge_expansion
//
//  Created by mac on 2018/4/13.
//  Copyright © 2018年 吴雪梅老师QQ:1377583010. All rights reserved.
//

#import "zjpEAIntroView.h"

//定义
static NSString *const desOption1 = @"这是第一页";
static NSString *const desOption2 = @"这是第二页 ";
static NSString *const desOption3 = @"这是第三页 ";
static NSString *const desOption4 = @"这是第四页 ";

@interface zjpEAIntroView ()<EAIntroDelegate>




@end

@implementation zjpEAIntroView

- (void)viewDidLoad {
    [super viewDidLoad];
   

}

- (IBAction)ClickAction:(id)sender {
    
    EAIntroPage *Page1 = [EAIntroPage page];
    Page1.title = @"hello world";
    Page1.desc= desOption1;
    Page1.bgImage = [UIImage imageNamed:@"bg1.jpg"];
    Page1.showTitleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"show1.jpg"]];
    
    EAIntroPage *Page2 = [EAIntroPage page];
    Page2.title = @"hello world";
    Page2.desc= desOption2;
    Page2.bgImage = [UIImage imageNamed:@"bg2.jpg"];
    Page2.showTitleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"show1.jpg"]];
    
    EAIntroPage *Page3 = [EAIntroPage page];
    Page3.title = @"hello world";
    Page3.desc= desOption3;
    Page3.bgImage = [UIImage imageNamed:@"bg3.jpg"];
    Page3.showTitleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"show2.jpg"]];
    
    EAIntroPage *Page4 = [EAIntroPage page];
    Page4.title = @"hello world";
    Page4.desc= desOption4;
    Page4.bgImage = [UIImage imageNamed:@"bg4.jpg"];
    Page4.showTitleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"show.jpg"]];
    
    EAIntroView *introArr = [[EAIntroView alloc]initWithFrame:self.view.frame andPages:@[Page1,Page2,Page3,Page4]];
    introArr.skipButtonAlignment =  EAViewAlignmentCenter;
    introArr.skipButtonY = 80;
    introArr.pageControlY = 42;
    [introArr showInView:self.view animateDuration:0.3];
    
}



@end

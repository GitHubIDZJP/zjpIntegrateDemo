
#import "second_level_oneViewController.h"
#import "XSpotLight.h"
@interface second_level_oneViewController ()<XSpotLightDelegate>

@end

@implementation second_level_oneViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}
-(void)viewDidAppear:(BOOL)animated{
    
    
    XSpotLight *SpotLight = [[XSpotLight alloc]init];
    SpotLight.messageArray = @[
                               @"这是《天下知道》",
                               @"点这里撰写文章",
                               @"搜索文章",
                               @"这会是StrongX的下一节课内容"
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)XSpotLightClicked:(NSInteger)index{
    NSLog(@"%ld",(long)index);
}



@end

//
//  zjpJDStatusBarNotificationViewController.m
//  NewKnowledge_expansion
//
//  Created by mac on 2018/4/13.
//  Copyright © 2018年 吴雪梅老师QQ:1377583010. All rights reserved.
//

#import "zjpJDStatusBarNotificationViewController.h"

@interface zjpJDStatusBarNotificationViewController ()

@end

@implementation zjpJDStatusBarNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
}
- (IBAction)showStatus:(id)sender {
    [JDStatusBarNotification showWithStatus:@"loading...."];
    dispatch_async(dispatch_get_global_queue(0, 0) , ^{
        [self doSomeing];
        //如果是AFN分话则不需要
        dispatch_async(dispatch_get_main_queue(), ^{
            [JDStatusBarNotification dismiss];
        });
    });
    
}
#pragma marlk 异步-->
- (void)doSomeing{
    
    sleep(3);//3秒后消失
}
- (IBAction)monitorStatus:(id)sender {
    [JDStatusBarNotification showWithStatus:@"123loading....." dismissAfter:3];//3秒后消失
   /**
    [JDStatusBarNotification showWithStatus:@"test"];
    [JDStatusBarNotification dismissAfter:3];*///跟上面一个意思
    
}
- (IBAction)showProgress:(id)sender {
     [JDStatusBarNotification showWithStatus:@"loading...."];
    [JDStatusBarNotification showProgress:0];//0-1
    dispatch_async(dispatch_get_global_queue(0, 0) , ^{
        [self showProgressCount ];
        //如果是AFN分话则不需要
        dispatch_async(dispatch_get_main_queue(), ^{
            [JDStatusBarNotification dismiss];
        });
    });
    
}
-(void)showProgressCount{
    float progress = 0;
    while (progress < 1.0)
    {
        progress+=0.1;
        dispatch_async(dispatch_get_main_queue(), ^{
            [JDStatusBarNotification showProgress:progress];
        });
    }
   
     usleep(50000);
}
- (IBAction)showActivity:(id)sender {
    [JDStatusBarNotification showWithStatus:@"loading...."];
    [JDStatusBarNotification showActivityIndicator:YES indicatorStyle: UIActivityIndicatorViewStyleGray];
    dispatch_async(dispatch_get_global_queue(0, 0) , ^{
        [self hideActivity ];
        //如果是AFN分话则不需要
        dispatch_async(dispatch_get_main_queue(), ^{
            [JDStatusBarNotification dismiss];
        });
    });
    
}

-(void)hideActivity{
     sleep(3);
}

- (IBAction)styleNewOfActivty:(id)sender {
    
    [JDStatusBarNotification  showWithStatus:@"loading..." styleName:@"JDStatusBarStyleWarning"];
    dispatch_async(dispatch_get_global_queue(0, 0) , ^{
        [self hideActivityNewStyle ];
        //如果是AFN分话则不需要
        dispatch_async(dispatch_get_main_queue(), ^{
            [JDStatusBarNotification dismiss];
        });
    });
}
-(void)hideActivityNewStyle{
    sleep(5);
}
@end

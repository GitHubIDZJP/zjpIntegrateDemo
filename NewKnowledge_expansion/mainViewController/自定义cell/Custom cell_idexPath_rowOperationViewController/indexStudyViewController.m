

#import "indexStudyViewController.h"

@interface indexStudyViewController ()

@property BOOL canceled;

@end

@implementation indexStudyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)MBPHUD:(UIButton *)sender {
    MBProgressHUD *SHOW =[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    SHOW.label.text = @"loading";
    SHOW.detailsLabel.text = @"success";
    //异步线程
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self doSomeing];
        //主线程刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            [SHOW hideAnimated:true];
        });
         
         }) ;
}

- (IBAction)MBPHUD1:(id)sender {
    MBProgressHUD *SHOW =[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    SHOW.mode =  MBProgressHUDModeDeterminate;//枚举
    SHOW.label.text = @"loading";
    SHOW.detailsLabel.text = @"success";
    //异步线程
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self doSomeingWithProgess];
        //主线程刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            [SHOW hideAnimated:true];
        });
        
    }) ;
}
- (IBAction)MBPHUD2:(id)sender {
    MBProgressHUD *SHOW =[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    SHOW.mode =  MBProgressHUDModeAnnularDeterminate;//枚举
    SHOW.label.text = @"loading";
    SHOW.detailsLabel.text = @"success";
    //异步线程
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self doSomeingWithProgess];
        //主线程刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            [SHOW hideAnimated:true];
        });
        
    }) ;
}
- (IBAction)MBPHUD3:(id)sender {
    MBProgressHUD *SHOW =[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    SHOW.mode =  MBProgressHUDModeDeterminateHorizontalBar;//枚举
    SHOW.label.text = @"loading";
    SHOW.detailsLabel.text = @"success";
    //异步线程
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self doSomeingWithProgess];
        //主线程刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            [SHOW hideAnimated:true];
        });
        
    }) ;
}
- (IBAction)MBPHUD4:(id)sender {
    MBProgressHUD *SHOW =[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    SHOW.label.text = @"loading.....";
    SHOW.mode = MBProgressHUDModeText;
    SHOW.offset = CGPointMake(0.f,MBProgressMaxOffset );
    [SHOW hideAnimated:true afterDelay:5];
}
- (IBAction)MBPHUD5:(id)sender {
    MBProgressHUD *SHOW =[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    SHOW.label.text = @"loading.....";
    SHOW.mode = MBProgressHUDModeCustomView;
    UIImage *image =[UIImage imageNamed:@"Bigneedle@2x.png"];
    SHOW.customView =  [[UIImageView alloc]initWithImage:image];
    SHOW.square = true;
    SHOW.offset = CGPointMake(0.f,MBProgressMaxOffset );
    [SHOW hideAnimated:true afterDelay:5];
}
- (IBAction)MBPHUD6:(id)sender {
    MBProgressHUD *SHOW =[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    SHOW.contentColor = [UIColor redColor];
    SHOW.mode =  MBProgressHUDModeAnnularDeterminate;//枚举
    SHOW.label.text = @"loading";
    [SHOW.button setTitle:@"cancel" forState: 0] ;
    [SHOW.button addTarget:self action:@selector(calcelAcation) forControlEvents: 1<< 6];
    
    //异步线程
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self doSomeingWithProgesszjp];
        //主线程刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            [SHOW hideAnimated:true];
        });
        
    }) ;
}

- (IBAction)MBPHUD7:(id)sender {
    
}


- (IBAction)MBPHUD8:(id)sender {
    
}


#pragma mark MBProgressHUD操作
-(void)doSomeing{
    sleep(3);
}

-(void)doSomeingWithProgess{
    
    float progress = 0.0;
    while (progress < 1.0f)
    {
        
        progress +=0.01f;
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD HUDForView:self.view].progress = progress;
        });
        usleep(15000);
    }
}


-(void)doSomeingWithProgesszjp{
    self.canceled = NO;
    float progress = 0.0;
    while (progress < 1.0f)
    {
        if(self.canceled){
            break;
        }
       
        progress +=0.01f;
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD HUDForView:self.view].progress = progress;
        });
        usleep(15000);
    }
}
-(void)calcelAcation{
    self.canceled = true;
}
@end


#import "BButtonViewController.h"

@interface BButtonViewController ()

@end

@implementation BButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   //btn style type//
    /**
     
     BButtonTypeDefault,
     BButtonTypePrimary,
     BButtonTypeInfo,
     BButtonTypeSuccess,
     BButtonTypeWarning,
     BButtonTypeDanger,
     BButtonTypeInverse,
     BButtonTypeTwitter,
     BButtonTypeFacebook,
     BButtonTypePurple,
     BButtonTypeGray
     
     */
    //CGRectMake(20,90,50,30)
    BButtonType  TYPE = BButtonTypeGray;
    BButton *btn = [[BButton alloc]initWithFrame:CGRectMake(20,90,90,30) type: BButtonTypeSuccess style:BButtonStyleBootstrapV2];
    
    [btn setTitle:@"Click" forState:0];
     [btn addAwesomeIcon:FANavicon beforeTitle:true];
    
   
     btn.center = self.view.center;
    [self.view addSubview:btn];
    
    
    
}




@end

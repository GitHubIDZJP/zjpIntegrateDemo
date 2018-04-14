

#import "zjpSDWebImageLoading.h"
#import "UIImageView+WebCache.h"

@interface zjpSDWebImageLoading ()
@property (weak, nonatomic) IBOutlet UIImageView *imageLoading;

@end

@implementation zjpSDWebImageLoading

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    NSString *URL = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1523657005848&di=4c2c65fc1f696cdd886eca070791e3ae&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2Fa6efce1b9d16fdfab0f3951bbe8f8c5495ee7ba3.jpg";
    
    _imageLoading.contentMode = UIViewContentModeScaleToFill;
    _imageLoading.layer.masksToBounds = true;
    
    [_imageLoading sd_setImageWithURL:[NSURL URLWithString:URL] placeholderImage:[UIImage imageNamed:@"imgName.png" ] completed:nil];
    
    
    
}











@end

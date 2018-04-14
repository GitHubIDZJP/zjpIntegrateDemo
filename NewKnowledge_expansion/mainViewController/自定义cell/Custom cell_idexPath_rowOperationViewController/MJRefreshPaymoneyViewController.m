

#import "MJRefreshPaymoneyViewController.h"

@interface MJRefreshPaymoneyViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    int page;
    NSString *Reset_Data;
}
@property(nonatomic,strong)UITableView *zjpTableView;
@property (nonatomic,strong) NSMutableArray *lazyLoadArr;

@end

@implementation MJRefreshPaymoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    page = 0;
    Reset_Data = @"header";
    
   // _lazyLoadArr = @[@"1",@"2",@"3",@"4",@"5"];
    self.zjpTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64,SCREEN_WIDTH , SCREEN_HEIGHT-60 ) style:UITableViewStyleGrouped];
    _zjpTableView.delegate=self;
    _zjpTableView.dataSource = self;
    _zjpTableView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_zjpTableView];
    
    [self dataRequest];
    
    _lazyLoadArr = [@[] mutableCopy];
    
    _zjpTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerAction) ];
    
    _zjpTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerAction)];
}
-(void)dataRequest{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(3);
        dispatch_async(dispatch_get_main_queue(), ^{
            //判断是上拉还行下拉
            //如果是上拉则清楚数据
            if([Reset_Data isEqualToString:@"header"])
            {
                [_lazyLoadArr removeAllObjects];
            }
            for(int i = 0;i< 20;i++){
                [_lazyLoadArr addObject:[NSString stringWithFormat:@"这是第%lu行",(unsigned long)_lazyLoadArr.count]];
            }
            //结束动画
            [_zjpTableView.mj_header endRefreshing];
            [_zjpTableView.mj_footer endRefreshing];
            [self.zjpTableView reloadData];
        });
    });
}
//下拉
-(void)headerAction{
    page = 0;
    Reset_Data = @"header";
    [self dataRequest];
}
//上拉
-(void)footerAction{
    page++;
    Reset_Data = @"footer";
    [self dataRequest];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _lazyLoadArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"it's cell ";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    
   
    if(cell == nil){
        cell  = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = self.lazyLoadArr[indexPath.row];
    return cell;
}


@end

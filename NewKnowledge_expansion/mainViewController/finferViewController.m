//
//  finferViewController.m
//  NewKnowledge_expansion
//
//  Created by mac on 2018/4/11.
//  Copyright © 2018年 吴雪梅老师QQ:1377583010. All rights reserved.
//

#import "finferViewController.h"
#define count 6

@interface finferViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UIScrollView *_scr;
    UIPageControl *_pg;
    NSTimer *_timer;
    //////myVie
    NSArray *array;
    NSArray *_btnArray;
}
@end

@implementation finferViewController
-(NSArray*)btnArr
{
    if(_btnArray == nil)
    {
        
        _btnArray=[NSArray array];
        NSMutableArray *mArr=[[NSMutableArray alloc]init];
        [mArr addObject:@"点击学习"];
        [mArr addObject:@"点击预约"];
        [mArr addObject:@"点击付费"];
        [mArr addObject:@"TPKeyboardAvoiding"];
         [mArr addObject:@"loadingImage"];
        _btnArray= mArr;
    }
    return _btnArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self RefreshUI];
}
-(void)RefreshUI{
    
    
    
    UIImage *backButtonImage = [[UIImage imageNamed:@""] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    
    UIBarButtonItem *imag=[[UIBarButtonItem alloc]initWithImage:backButtonImage style:UIBarButtonItemStylePlain target:self action:nil];
    
    self.navigationItem.rightBarButtonItem=imag;
    
    UIBarButtonItem *gz =[[UIBarButtonItem alloc]initWithTitle:@"广州" style:UIBarButtonItemStyleDone target:self action: nil ];
    
    UIImage *pictureButton=[[UIImage imageNamed:@""] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    UIBarButtonItem *pb=[[UIBarButtonItem alloc]initWithImage:pictureButton style:UIBarButtonItemStylePlain target:self action:@selector(animationEvents:)];
    NSArray *itemsArr=@[gz,pb];
    self.navigationItem.leftBarButtonItems=itemsArr;
    //TableView
    UITableView *tab=[[UITableView alloc]initWithFrame:CGRectMake(0,rectOfNavigationbar+rectOfStatusbar+300,SCREEN_WIDTH,667-64) style:UITableViewStylePlain];
    [self.view addSubview:tab];
    tab.backgroundColor=DYTColor(52,65,84);
    tab.delegate=self;
    tab.dataSource=self;
    
    _scr=[[UIScrollView alloc]initWithFrame:CGRectMake(0,rectOfNavigationbar+rectOfStatusbar,SCREEN_WIDTH,200)];
    //rectOfNavigationbar+rectOfStatusbar+200
    //_scr.contentSize=CGSizeMake(count*SCREEN_WIDTH,SCREEN_SCREEN_HEIGHT);
    _scr.contentSize=CGSizeMake((count + 2) * SCREEN_WIDTH,SCREEN_HEIGHT);
    _scr.pagingEnabled=YES;
    [self.view addSubview:_scr];
    for(int i=0;i < count + 2;i++)
    {
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(i*SCREEN_WIDTH,0,SCREEN_WIDTH,_scr.frame.size.height)];
        NSString *imageName=[NSString stringWithFormat:@"0%d.jpg",i];
        //Judgement page number
        if(i == 0)
        {
            imageName = @"06.jpg";
        }else if (i == count + 1)//7
        {
            imageName = @"01.jpg";
        }
        imageView.image=[UIImage imageNamed:imageName];
        [_scr addSubview:imageView];
    }
    _pg=[[UIPageControl alloc]initWithFrame:CGRectMake(100,rectOfNavigationbar+rectOfStatusbar+170,SCREEN_WIDTH-200,30)];
    _pg.numberOfPages=count;
    _pg.currentPageIndicatorTintColor=[UIColor blackColor];
    _pg.pageIndicatorTintColor=[UIColor whiteColor];
    _pg.currentPage=0;
    //[_pg addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_pg];
    _scr.delegate=self;
    //create-timer
    [self createTimer];
    /*******************/
    //MyView
    NSMutableArray *arrayValue = [[NSMutableArray alloc]init];
    for (int i = 1; i<= 5; i++)
    {
        NSString *value = [NSString stringWithFormat:@"style%d.png",i];
        
        [arrayValue addObject:value];
        
    }
    
    
    array = arrayValue;
    CGFloat xSpace = (self.view.frame.size.width - 95 * 4)/5; //间隙
    NSArray *pricesArr=@[@"找老师",@"公开选修课",@"作业大厅",@"精彩直播"];
    int a =4;
    for(int i=0;i < 4;i++)
    {
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(xSpace+(i % a) * (xSpace +110),rectOfNavigationbar+rectOfStatusbar+200+( i / a) * (xSpace +10),self.view.frame.size.width / 3,100)];
        view.backgroundColor= DYTColor(30, 90, 100);
        view.userInteractionEnabled = YES;
        view.tag = 100+i;
        [self.view addSubview:view];
        
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(15,10,92-30,60)];
        
        imageView.image=[UIImage imageNamed:array[i]];
        
        [view addSubview:imageView];
        UILabel *price= [[UILabel alloc]initWithFrame:CGRectMake(0,75,92,20)];
        price.text=pricesArr[i];
        price.font=[UIFont systemFontOfSize:14];
        price.textAlignment=NSTextAlignmentCenter;
        price.textColor=[UIColor whiteColor];
        [view addSubview:price];
        UITapGestureRecognizer *tapGestureRecognizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
        
        [view addGestureRecognizer:tapGestureRecognizer2];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 1;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 12)];
    headerView.backgroundColor = DYTColor(52,65,84);
    return headerView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//行*列
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"it's cell";
    MyTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        
        cell=[[MyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.backgroundColor=DYTColor(52,65,84);
        cell.icon.image=[UIImage imageNamed:@"love@2x.png"];
        cell.Tutorial.text=@"暑假夏令营学前数学补习班";
        cell.learning.image=[UIImage imageNamed:@"kaike@2x.png"];
        
        cell.subClass.text=@"第08节课";
        
        cell.advertisementIntroduction.text=@"(短语广告介绍)";
        
        
        
    }
    
    for (UIView *btn in cell.contentView.subviews)
    {
        
        if ([btn isKindOfClass:[UIButton class]])
        {
            [btn removeFromSuperview];
            
        }
        
    }
    
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.backgroundColor=DYTColor(52,65,84);
    btn.frame=CGRectMake(self.view.frame.size.width-100,40,90,30);
    btn.layer.cornerRadius=5;
    btn.layer.borderColor=DYTColor(148,120,89).CGColor;
    btn.layer.borderWidth=1.5;
    UIColor *setTitleColor=DYTColor(233, 181, 98);
    [btn setTintColor:setTitleColor];
    btn.titleLabel.font=[UIFont systemFontOfSize:15];
    [btn  setContentVerticalAlignment:0];//center
    switch (indexPath.row)
    {
        case 0:
        {
            btn.tag=100;
            [btn  setTitle:self.btnArr[0] forState:UIControlStateNormal];
            break;
        }
        case 1:
        {
            btn.tag=101;
            [btn setTitle:self.btnArr[1] forState:UIControlStateNormal];
            break;
        }
        case 2:
        {
            btn.tag=102;
            [btn setTitle:self.btnArr[2] forState:UIControlStateNormal];
            break;
        }
        case 3:
        {
            btn.tag=103;
            [btn setTitle:self.btnArr[3] forState:UIControlStateNormal];
            break;
        }
        case 4:
        {
            btn.tag=103;
            [btn setTitle:self.btnArr[4] forState:UIControlStateNormal];
            break;
        }
        default:
            break;
    }
    [btn addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:btn];
    return cell;
}

-(void)actionBtn:(UIButton*)btn

{
    //NSUInteger index = button.tag;
    //if(index)
    if(btn.tag==100)
    {
        //切换 页面
        second_level_oneViewController *learning=[[second_level_oneViewController alloc]init];
        [self presentViewController:learning animated:YES completion:nil];
        
    }
    else if (btn.tag==101)
    {
        //切换页面
        second_level_twoViewController *reserce=[[second_level_twoViewController alloc]init];
        [self presentViewController:reserce animated:YES completion:nil];
    }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //操作
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.row==0)
    {
        indexStudyViewController *one=[indexStudyViewController new];
        [self presentViewController:one animated:YES completion:nil];
    }else if (indexPath.row==1)
    {
        zjpKXMenu *two=[[zjpKXMenu alloc]init];
        [self presentViewController:two animated:YES completion:nil];
    }
    else if(indexPath.row == 2)
    {
        MJRefreshPaymoneyViewController  *paymoney = [[MJRefreshPaymoneyViewController alloc]init];
        [self presentViewController: paymoney animated:YES completion:nil];
    } else if(indexPath.row == 3)
    {
       zjpTPKeyboardAvoidingScrollview *tpScrollView =[[zjpTPKeyboardAvoidingScrollview alloc]init];
        [self  presentViewController:tpScrollView animated:YES completion:nil];
    }else if(indexPath.row == 4)
    {
        zjpSDWebImageLoading *webImage =[[zjpSDWebImageLoading alloc]init];
         [self  presentViewController:webImage animated:YES completion:nil];
    }
    
}
//赋值
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(void)animationEvents:(UIButton*)sender
{
    [QQPopMenuView showWithItems:@[@{@"title":@"发起讨论",@"imageName":@"ketang@2x.png"},
                                   @{@"title":@"扫描名片",@"imageName":@"fudu@2x.png"},
                                   @{@"title":@"写日报",@"imageName":@"kongzhi@2x.png"},
                                   @{@"title":@"外勤签到",@"imageName":@"shouye@2x.png"}]
                           width:130
                triangleLocation:CGPointMake([UIScreen mainScreen].bounds.size.width-30, 64+5)
                          action:^(NSInteger index) {
                              NSLog(@"点击了第%ld行",index);
                          }];
    NSLog(@"CLICK");
}
-(void)enterTeamCard:(UIButton*)sender
{
    
}
-(void)enterehzFilesVC:(UIButton*)sender
{
    
}

-(void)addBtnClicked:(UIButton*)sender
{
    
}
- (void)tapped:(UITapGestureRecognizer *)gesture

{
    ///NSInteger index = gesture.view.tag;
    //UIButton *thisbtn=(UITapGestureRecognizer*)gesture;
    if(gesture.view.tag== 100)
    {
      
        
        SeekViewController *seek = [[SeekViewController alloc]init];
        [self presentViewController:seek animated:YES completion:nil];
        NSLog(@"页面跳转");
        
    }else if (gesture.view.tag== 101)
    {
       zjpJDStatusBarNotificationViewController *ec=[zjpJDStatusBarNotificationViewController new];
        [ self presentViewController:ec animated:YES completion:nil];
        
    }
    else if (gesture.view.tag== 102)
    {
       BButtonViewController *oh=[BButtonViewController new];
        [ self presentViewController:oh animated:YES completion:nil];
        
    }
    else if (gesture.view.tag== 103)
    {
        
        zjpEAIntroView *test= [[zjpEAIntroView alloc]init];
        [ self presentViewController:test animated:YES completion:nil];
        
    }
}
-(void)createTimer
{
    _timer=[NSTimer  scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(runTimer:) userInfo:nil repeats:YES];
}
-(void)runTimer:(NSTimer *)runAction
{
    [_scr setContentOffset:CGPointMake((_pg.currentPage +2) *SCREEN_WIDTH,0) animated:YES];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(_scr.contentOffset.x ==0)
    {
        //1-6连接：1=6
        _scr.contentOffset = CGPointMake(count * SCREEN_WIDTH, 0);
    }
    else if (_scr.contentOffset.x == (count + 1) * SCREEN_WIDTH)
    {
        _scr.contentOffset =CGPointMake(SCREEN_WIDTH,0);
    }
    //开始滚动
    _pg.currentPage =_scr.contentOffset.x / SCREEN_WIDTH-1;
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [_timer setFireDate:[NSDate distantFuture]];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [_timer setFireDate:[NSDate distantPast]];
}
//-(void)change:(UIPageControl*)change
//{
//    [_scr setContentOffset:CGPointMake(_pg.currentPage *SCREEN_WIDTH,0) animated:YES];
//}

//-(void)change:(UIPageControl*)change
//{
//    [_scr setContentOffset:CGPointMake(_pg.currentPage *SCREEN_WIDTH,0) animated:YES];
//}

@end

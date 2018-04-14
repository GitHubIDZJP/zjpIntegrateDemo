//
//  MyTableViewCell.m
//  Project-sample
//
//  Created by mac on 2017/11/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "MyTableViewCell.h"
#define DYTColor(r,g,b)[UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
@implementation MyTableViewCell

//2.重写初始化方法
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
  
        self.icon=[[UIImageView alloc]init];
        [self.contentView addSubview:self.icon];
        
        self.learning=[[UIImageView alloc]init];
        [self.contentView addSubview:self.learning];
        
        self.Tutorial=[[UILabel alloc]init];
        [self.contentView addSubview:self.Tutorial ];
      
        
        
        
        self.subClass=[[UILabel alloc]init];
        [self.contentView addSubview: self.subClass];
        
        self.advertisementIntroduction=[[UILabel alloc]init];
        [self.contentView addSubview: self.advertisementIntroduction];
    }
    return self;
}
//3 对上面进行初始化的控件设置大小(信息属性)

-(void)layoutSubviews
{
    [super layoutSubviews];
 
   /** property(nonatomic,strong)UIImageView *icon;//头像
    @property(nonatomic,strong)UIImageView *learning;//开课中
    @property(nonatomic,strong)UILabel *Tutorial;//补习
    
    @property(nonatomic,strong)UILabel *subClass;//第08节课
    @property(nonatomic,strong)UILabel *advertisementIntroduction;//广告介绍
**/
    
    self.icon.frame=CGRectMake(10,10,110,60);
    self.Tutorial.frame=CGRectMake(130,15,210,15);
    self.learning.frame=CGRectMake(133,35,30,13);
  
  
    self.subClass.frame=CGRectMake(130,50,80,20);
    self.advertisementIntroduction.frame=CGRectMake(10,70,90,25);
    
    
    self.icon.backgroundColor=DYTColor(30,40,50);
    self.learning.backgroundColor=DYTColor(90,100,30);
   
    self.subClass.backgroundColor=DYTColor(66,77,95);
    
    self.advertisementIntroduction.font=[UIFont systemFontOfSize:12];
    self.advertisementIntroduction.textColor=[UIColor whiteColor];
    self.Tutorial.textColor=[UIColor whiteColor];
    self.subClass.textColor=[UIColor whiteColor];
    self.subClass.font=[UIFont systemFontOfSize:12];
    self.subClass.textAlignment=NSTextAlignmentCenter;
    self.subClass.layer.cornerRadius=5;
    self.subClass.layer.masksToBounds=YES;
    
    
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

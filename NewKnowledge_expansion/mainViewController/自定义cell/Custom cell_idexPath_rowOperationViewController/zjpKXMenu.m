//
//  zjpKXMenu.m
//  NewKnowledge_expansion
//
//  Created by mac on 2018/4/13.
//  Copyright © 2018年 吴雪梅老师QQ:1377583010. All rights reserved.
//

#import "zjpKXMenu.h"

@interface zjpKXMenu ()

@end

@implementation zjpKXMenu

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)showMenu:(id)sender {
    KxMenuItem *search = [KxMenuItem  menuItem:@"search" image:[UIImage imageNamed:@"search_icon.png"] target:self action:@selector(serchAction:)];
     KxMenuItem *action = [KxMenuItem  menuItem:@"action" image:[UIImage imageNamed:@"action_icon.png"] target:self action:@selector(Action:)];
     KxMenuItem *check = [KxMenuItem  menuItem:@"check" image:[UIImage imageNamed:@"check_icon.png"] target:self action:@selector(checkAction:)];
     KxMenuItem *home = [KxMenuItem  menuItem:@"home" image:[UIImage imageNamed:@"home_icon.png"] target:self action:@selector(homeAction:)];
     KxMenuItem *reload = [KxMenuItem  menuItem:@"reload" image:[UIImage imageNamed:@"search_icon.png"] target:self action:@selector(reloadAction:)];
    NSArray *arrItems = @[search,action,home,reload,check];
    [KxMenu showMenuInView:self.view fromRect:((UIButton *)sender).frame menuItems:arrItems];
    [KxMenu setTintColor:[UIColor redColor]];
    //注意：要改颜色：自己去源码改就行
}
-(void)serchAction:(KxMenuItem*)sender{
    NSLog(@"1");
    searchViewController *subSearch = [[searchViewController alloc]init];
    [self presentViewController:subSearch animated:YES completion:nil];
}
-(void)Action:(KxMenuItem*)sender{
    NSLog(@"12");
    actionViewController *subAction = [[actionViewController alloc]init];
    [self presentViewController:subAction animated:YES completion:nil];
}
-(void)checkAction:(KxMenuItem*)sender{
    NSLog(@"13");
    homeViewController *subHome = [[homeViewController alloc]init];
    [self presentViewController:subHome animated:YES completion:nil];
}
-(void)homeAction:(KxMenuItem*)sender{
    NSLog(@"14");
    reloadViewController *subRload   = [[reloadViewController alloc]init];
    [self presentViewController:subRload animated:YES completion:nil];
}
-(void)reloadAction:(KxMenuItem*)sender{
    NSLog(@"15");
    checkViewController *subCheck   = [[checkViewController alloc]init];
    [self presentViewController:subCheck animated:YES completion:nil];
}




@end



#import "AppDelegate.h"
#import "followerViewController.h"
#import "finferViewController.h"
#import "friendsViewController.h"
#import "meViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];
    
    finferViewController *one=[[finferViewController alloc]init];
    //one.view.backgroundColor=DYTColor(12,20,40);// 设置view背景色
    UINavigationController *home=[[UINavigationController alloc]initWithRootViewController:one];
    
    home.navigationBar.barTintColor =DYTColor(30,42,66);//设置导航条的背景色
    
    
    followerViewController *two=[[followerViewController alloc]init];
    //two.view.backgroundColor=DYTColor(12,20,40);
    UINavigationController *Classroom=[[UINavigationController alloc]initWithRootViewController:two];
    Classroom.navigationBar.barTintColor =DYTColor(30,42,66);
    
    
    friendsViewController *three=[[friendsViewController alloc]init];
    //three.view.backgroundColor=DYTColor(12,20,40);
    UINavigationController *controlRoom=[[UINavigationController alloc]initWithRootViewController:three];
    controlRoom.navigationBar.barTintColor =DYTColor(30,42,66);
    
    meViewController *four=[[meViewController alloc]init];
    //four.view.backgroundColor=DYTColor(12,20,40);
    UINavigationController *Repeater=[[UINavigationController alloc]initWithRootViewController:four];
    Repeater.navigationBar.barTintColor =DYTColor(30,42,66);
    
    UITabBarController *tabBar=[[UITabBarController alloc]init];
    
    tabBar.viewControllers=@[home,Classroom,controlRoom,Repeater];
    
    //////
    
    //添加头像
    one.tabBarItem.image=[UIImage imageNamed:@"shouye@2x.png"];
    two.tabBarItem.image=[UIImage imageNamed:@"ketang@2x.png"];
    three.tabBarItem.image=[UIImage imageNamed:@"kongzhi@2x.png"];
    four.tabBarItem.image=[UIImage imageNamed:@"fudu@2x.png"];
    
    one.tabBarItem.title=@"发现";
    two.tabBarItem.title=@"关注";
    three.tabBarItem.title=@"简友圈";
    four.tabBarItem.title=@"我的";
    
    tabBar.tabBar.tintColor=DYTColor(254,190,85);
    tabBar.tabBar.barTintColor=DYTColor(10,20,40);
    //tabBar.tabBar.backgroundImage=[UIImage imageNamed:@"clock-xg@2x.png"];
    
    self.window.rootViewController=tabBar;
    
    //看这这里
    //     rootyView *rootV=[rootyView new];
    //     self.window.rootViewController=rootV;
    
    [self.window makeKeyWindow];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

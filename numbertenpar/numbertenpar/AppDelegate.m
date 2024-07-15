//
//  AppDelegate.m
//  numbertenpar
//
//  Created by adin on 2024/7/8.
//

#import "AppDelegate.h"
#import "NUMHomeViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
 
    
    
  
    
    
    // 创建一个新的 UIWindow 实例，并将其大小设置为屏幕的大小
       self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
       
       // 使用 MainViewController.xib 文件来初始化 MainViewController 实例
    NUMHomeViewController *mainViewController = [[NUMHomeViewController alloc] initWithNibName:@"NUMHomeViewController" bundle:nil];
       
       // 将 mainViewController 设置为 window 的根视图控制器
       self.window.rootViewController = mainViewController;
       
       // 显示 window
       [self.window makeKeyAndVisible];
    return YES;
}




@end

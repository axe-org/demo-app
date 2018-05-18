//
//  AppDelegate.m
//  Demo
//
//  Created by 罗贤明 on 2018/3/10.
//  Copyright © 2018年 罗贤明. All rights reserved.
//

#import "AppDelegate.h"
#import "AXETabBarController.h"
#import "Axe.h"
#import "AXEWebViewController.h"
#import "AXEWKWebViewController.h"
#import "AXEReactViewController.h"
#import "AXEOfflineWebViewController.h"
#import "AXEOfflineWKWebViewController.h"
#import "AXEOfflineReactViewController.h"
#import <React/UIView+React.h>
#import "DemoGround.h"
#import "AXEDynamicRouter.h"
#import "AXEReactViewController.h"
#import "OPOfflineManager.h"

#import <Login/API.h>
#import <Test/API.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // 跟随APP打包的 离线包，需要指明文件名。
    [OPOfflineManager sharedManager].buildInModules = @[@"test-h5.zip", @"test-react.zip"];

    
    [AXEAutoreleaseEvent registerSyncListenerForEventName:AXEEventModulesBeginInitializing handler:^(AXEData *payload) {
        // 测试时，通过默认值固定动态路由映射规则。 动态切换模块实现。
        NSDictionary *defaultSetting = @{
                                         //@"login": @"https://demo.axe-org.cn/login-h5/#/", // 线上h5的login
                                         @"login":@"axe://login/", // 本地的原生login
                                         //@"login":@"reacts://demo.axe-org.cn/login-react/bundle.js?module=" // 线上的react-native版本的login模块
                                         //@"login":@"react://192.168.1.3:8081/index.bundle?platform=ios&module="
                                         };
        [[AXEDynamicRouter sharedDynamicRouter] setupWithURL:nil defaultSetting:defaultSetting];
//        [[AXEDynamicRouter sharedDynamicRouter] setupWithURL:@"https://dynamic.demo.axe-org.cn/query" defaultSetting:defaultSetting];
        
        
        // 设置 tabbarController
        // 第一个为 原生的Test模块
        AXETabBarItem *itema = [AXETabBarItem itemWithPath:TEST_TABROUTER_PATH viewRoute:TEST_ROUTER_HOME];
        itema.title = @"ios";
        itema.normalIcon = [UIImage imageNamed:@"ios"];
        [AXETabBarController registerTabBarItem:itema];
        // 第二个为 使用离线包的h5版本的Test模块
        AXETabBarItem *itemb = [AXETabBarItem itemWithPath:@"html" viewRoute:@"ophttp://h5test/home"];
//        AXETabBarItem *itemb = [AXETabBarItem itemWithPath:@"html" viewRoute:@"http://localhost:8080/#/home"];
        itemb.title = @"html";
        itemb.normalIcon = [UIImage imageNamed:@"html"];
        [AXETabBarController registerTabBarItem:itemb];
        // 第三个为 使用离线包的react-native版本的Test模块
//        AXETabBarItem *itemc = [AXETabBarItem itemWithPath:@"react" viewRoute:@"react://192.168.1.3:8081/index.bundle?platform=ios&module=home"];
        AXETabBarItem *itemc = [AXETabBarItem itemWithPath:@"react" viewRoute:@"oprn://reacttest/home"];
        itemc.title = @"react";
        itemc.normalIcon = [UIImage imageNamed:@"react"];
        [AXETabBarController registerTabBarItem:itemc];
    } priority:DEMOGROUND_MODULE_INIT_PRIORITY];
    // 通过通知，实现模块自注册 ， 依次初始化。
    [AXEModuleInitializerManager initializeModules];
    
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

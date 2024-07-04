//
//  AppDelegate.h
//  tenpatunity
//
//  Created by feng ting on 2024/7/4.
//

#import <UIKit/UIKit.h>
#include <UnityFramework/UnityFramework.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,UnityFrameworkListener>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) UnityFramework *ufw;

- (void)showUnityView;

- (void)showNativeView;

@end


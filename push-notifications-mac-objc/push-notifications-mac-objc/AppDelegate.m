#import "AppDelegate.h"
@import PushNotifications;

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [[PushNotifications shared] registerWithInstanceId:@"97c56dfe-58f5-408b-ab3a-158e51a860f2"];
}

- (void)application:(NSApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [[PushNotifications shared] registerDeviceToken:deviceToken completion:^{
        NSError *anyError;
        [[PushNotifications shared] subscribeWithInterest:@"hello" error:&anyError completion:^{
            if (anyError) {
                NSLog(@"Error: %@", anyError);
            }
            else {
                NSLog(@"Subscribed to interest hello.");
            }
        }];
    }];
}

- (void)application:(NSApplication *)application didReceiveRemoteNotification:(NSDictionary<NSString *,id> *)userInfo {
    NSLog(@"%@", userInfo);
}

- (void)application:(NSApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"Remote notification support is unavailable due to error: %@", error.localizedDescription);
}

@end

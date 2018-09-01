//
//  AppDelegate.m
//  Airfield-Manager
//
//  Created by Terrance Miller on 9/17/14.
//  Copyright (c) 2014 Terrance Miller. All rights reserved.
//

#import "AppDelegate.h"
#import <GoogleMaps/GoogleMaps.h>
#import "AircraftDatabase.h"
#import "AircraftInfo.h"
#import "NavigationController.h"

@implementation AppDelegate

@synthesize navController = _navController;
@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    //[GMSServices provideAPIKey:@"AIzaSyBhP-RC9fbyK0geEtMVn77ZKzqKwfvn3CY"]; //Not working? old?
    [GMSServices provideAPIKey:@"AIzaSyBYTPSGmxkqHZmAhAaAYyy28ek6AGHvwc8"];
    // Override point for customization after application launch.
    
    //Log for debugging purposses
    /*NSArray *aircraftInfos = [AircraftDatabase database].aircraftInfos;
    for (AircraftInfo *info in aircraftInfos) {
        NSLog(@"%d: %@, %@, %@", info.uniqueId, info.aircraft, info.wing_span, info.length);
    }*/
    
    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    pageControl.backgroundColor = [UIColor whiteColor];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
    [window addSubview:_navController.view];

}

-(void)dealloc
{
    //[window release];
    self.navController = nil;
}

@end



//
//  AppDelegate.m
//  Delegates
//
//  Created by Кирилл Ковыршин on 19.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "AppDelegate.h"
#import "Doctor.h" 
#import "Patient.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    Patient * patient1  = [[Patient alloc] init];
    patient1.name = @"Ковыршин Кирилл Анатольевич";
    patient1.temperature = 36.6f;
    
    Patient * patient2  = [[Patient alloc] init];
    patient2.name = @"Шевкунов Егор Сергеевич";
    patient2.temperature = 40.2f;
    
    Patient * patient3  = [[Patient alloc] init];
    patient3.name = @"Василий";
    patient3.temperature = 37.1f;
    
    Patient * patient4  = [[Patient alloc] init];
    patient4.name = @"Анна";
    patient4.temperature = 38.f;
    
    Doctor * doctor = [[Doctor alloc]init];
    
    patient1.delegate = doctor;
    patient2.delegate = doctor;
    patient3.delegate = doctor;
    patient4.delegate = doctor;
    
    NSLog(@"%@ Are you ok? %@",patient1.name, [patient1 howAreYou] ? @"Yes" : @"No");
    NSLog(@"%@ Are you ok? %@",patient2.name, [patient2 howAreYou] ? @"Yes" : @"No");
    NSLog(@"%@ Are you ok? %@",patient3.name, [patient2 howAreYou] ? @"Yes" : @"No");
    NSLog(@"%@ Are you ok? %@",patient4.name, [patient2 howAreYou] ? @"Yes" : @"No");

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

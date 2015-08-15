//
//  AppDelegate.m
//  Lesson3HW
//
//  Created by Кирилл Ковыршин on 15.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//  Домашняя работа к уроку 3
//  Реализую диалог к человеком через класс HumanDialog с использованием селекторов и передачей различных
//  типов данных
//
//

#import "AppDelegate.h"
#import "HumanDialog.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
  
    HumanDialog * human = [[HumanDialog alloc] init]; // Создание объекта
    
    [human sayHello];
    
    //Переменные
    NSString * name = @"Кирилл";
    NSInteger age = 28;
    NSString * sex = @"Мужской";
    CGFloat height = 183.45f;
    CGFloat weight = 99.25f;
    NSInteger marital = 1; //0 или 1
    NSString * programmingLaguage = @"Objective-C";
    
    //Вызов основного метода
    [human startDialog:name sex:sex age:age height:height weight:weight maritalStatus:marital programmingLaguage:programmingLaguage];
    
    NSLog(@"\n\n----------\n\n");
    
    //Переменные
    NSString * nameHuman = @"Ольга";
    NSInteger ageHuman = 27;
    NSString * sexHuman = @"Женский";
    CGFloat heightHuman = 174.0f;
    CGFloat weightHuman = 53.51f;
    NSInteger maritalHuman = 1; //0 или 1
    NSString * programmingLaguageHuman = @"Не программирую";
    
    //Вызов основного метода
    [human startDialog:nameHuman sex:sexHuman age:ageHuman height:heightHuman weight:weightHuman maritalStatus:maritalHuman programmingLaguage:programmingLaguageHuman];
    
    //Методы вызываемые селектором
    [human performSelector:@selector(studyData) withObject:nil afterDelay:3];
    [human performSelector:@selector(separator) withObject:nil afterDelay:5];
    [human performSelector:@selector(separator) withObject:nil afterDelay:7];
    [human performSelector:@selector(separator) withObject:nil afterDelay:9];
    [human performSelector:@selector(studyDataFinish) withObject:nil afterDelay:11];
    [human performSelector:@selector(addToDatabase) withObject:nil afterDelay:12];
    
    NSLog(@"Спасибо за пройденный опрос");
    
    
    
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

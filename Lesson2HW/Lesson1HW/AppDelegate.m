//
//  AppDelegate.m
//  Lesson1HW
//
//  Created by Кирилл Ковыршин on 07.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "AppDelegate.h"

//Импортирование класса изготовления ноутбука
#import "UnitFactory.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //Создание указателя на экземпляр класса NotebookFactory, выделение памяти и инициализаци
    NotebookFactory * productionNotebook = [[NotebookFactory alloc] init];
    
    //Создание указателя на экземпляр дочернего класса UnitFactory, выделение памяти и инициализаци
    UnitFactory * vipProductionNotebook = [[UnitFactory alloc] init];
    
    [productionNotebook startFactory]; // Запуск изготовления
    [productionNotebook finishFactory]; // Окончание изготовления
    [productionNotebook startAssembly]; // Запуск сборки
    [productionNotebook finishAssembly]; // Окончание сборки
    [productionNotebook startPackaging]; // Запуск упаковки
    [productionNotebook finishPackaging]; // Окончание упаковки
    [vipProductionNotebook operationSystem:@"Windows 7"];
    [vipProductionNotebook installOS]; //Установка операционной системы
    
    [UnitFactory unit]; //Обращение к методу класса
    
    [vipProductionNotebook startFactory]; // Запуск изготовления
    [vipProductionNotebook finishFactory]; // Окончание изготовления
    [vipProductionNotebook startAssembly]; // Запуск сборки
    [vipProductionNotebook finishAssembly]; // Окончание сборки
    [vipProductionNotebook startPackaging]; // Запуск упаковки
    [vipProductionNotebook finishPackaging]; // Окончание упаковки
    [vipProductionNotebook operationSystem:@"Windows 7"];
    [vipProductionNotebook installOS]; //Установка операционной системы
    
    
    //Цикл присвоения SN и Модели каждому из произведенных ноутбуков на основании функции рандомной генерации число от 0 до 99
    long int countNotebook = [vipProductionNotebook countNotebook];
    NSLog(@"Было произведено: %li шт.",countNotebook);
    for (int i=0; countNotebook>i; i++) {
        NSString * snOs = [vipProductionNotebook randomSnOs];
        NSString * snRand = [vipProductionNotebook randomStringWithLength:10]; //Ранндомный генератор серийного номера
        NSString * alphaVersion = [vipProductionNotebook randomStringWithLength:4]; //Ранндомный генератор модели
        int sVersion = arc4random() % countNotebook;
        
        [vipProductionNotebook setSn:snRand]; //Сеттер для параметра sn        
        [vipProductionNotebook setModel:[self randVersion:i+1 subVersion:sVersion alphaVersion:alphaVersion]]; //Сеттер для параметра Model
        [vipProductionNotebook setSnOs:snOs]; //Сеттер для параметра snOs
        
        NSLog(@"Серийный номер Windows: %@",vipProductionNotebook.snOs); //геттер для snOs
        NSLog(@"Ноутбуку был установлен SN: %@", vipProductionNotebook.sn); //геттер для sn
        NSLog(@"Модель ноутбука: %@\n\n", vipProductionNotebook.model); //геттер для model
        
    }
    //
    
    [vipProductionNotebook notebookOwner:@"Ковыршин Кирилл" phoneNumber:@"+7 909 9 888 77 1" countUser:4];
    [self finishFactory]; //Встроенный метод, выводящий благодарность за посещениеv
    
    
    return YES;
}

//Встроенный метод, вывода благодарности за посещение

- (NSString *) randVersion: (int) version subVersion: (int) subVersion alphaVersion: (NSString*) alphaVersion{
    
    NSString* a = [NSString stringWithFormat:@"%@ v.%i.%i",alphaVersion,version,subVersion];
    
    return a;
}

- (void) finishFactory {
    NSLog(@"Спасибо что посетили наш завод! Удачи Вам и успехов.\n ");
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

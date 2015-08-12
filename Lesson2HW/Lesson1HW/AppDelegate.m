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
    NotebookFactory * VIPproductionNotebook = [[NotebookFactory alloc] init];
    
    //Создание указателя на экземпляр дочернего класса UnitFactory, выделение памяти и инициализаци
    UnitFactory * productionNotebook = [[UnitFactory alloc] init];
    
    [VIPproductionNotebook startFactory]; // Запуск изготовления
    [VIPproductionNotebook finishFactory]; // Окончание изготовления
    [VIPproductionNotebook startAssembly]; // Запуск сборки
    [VIPproductionNotebook finishAssembly]; // Окончание сборки
    [VIPproductionNotebook startPackaging]; // Запуск упаковки
    [VIPproductionNotebook finishPackaging]; // Окончание упаковки
    [productionNotebook operationSystem:@"Windows 7"];
    [productionNotebook installOS]; //Установка операционной системы

    
    [UnitFactory unit]; //Обращение к методу класса
    
   
    
    [productionNotebook startFactory]; // Запуск изготовления
    [productionNotebook finishFactory]; // Окончание изготовления
    [productionNotebook startAssembly]; // Запуск сборки
    [productionNotebook finishAssembly]; // Окончание сборки
    [productionNotebook startPackaging]; // Запуск упаковки
    [productionNotebook finishPackaging]; // Окончание упаковки
    [productionNotebook operationSystem:@"Windows 7"];
    [productionNotebook installOS]; //Установка операционной системы
    
    
    //Цикл присвоения SN и Модели каждому из произведенных ноутбуков на основании функции рандомной генерации число от 0 до 99
    long int countNotebook = [productionNotebook countNotebook];
    NSLog(@"Было произведено: %li шт.",countNotebook);
    for (int i=0; countNotebook>i; i++) {
        
        NSString * snRand = [productionNotebook randomStringWithLength:10]; //Ранндомный генератор серийного номера
        
        [productionNotebook setSn:snRand]; //Сеттер для параметра SN
        [productionNotebook setModel:@"AQ_v1.0"]; //Сеттер для параметра Model
        
        NSLog(@"Ноутбуку был установлен SN: %@", productionNotebook.sn);
        NSLog(@"Модель ноутбука: %@", productionNotebook.model);
        
    }
    //
    
    [productionNotebook notebookOwner:@"Ковыршин Кирилл" phoneNumber:@"+7 909 9 888 77 1" countUser:4];
    [self finishFactory]; //Встроенный метод, выводящий благодарность за посещениеv
    
    
    return YES;
}

//Встроенный метод, вывода благодарности за посещение

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

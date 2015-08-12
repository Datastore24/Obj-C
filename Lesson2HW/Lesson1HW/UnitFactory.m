//
//  UnitFactory.m
//  Lesson1HW
//
//  Created by Кирилл Ковыршин on 11.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "UnitFactory.h"

@implementation UnitFactory


//Метод класса

+ (void) unit {
    NSLog(@"Вы обратились к дочернему подразделению. \n Будет произведена установка операционной системы и VIP упаковка.\n ");
}

//Рандомное значение
NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

- (NSString *) randomStringWithLength: (int) len {
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
    }
    
    return randomString;
}

// Выбор операционной системы

- (void) operationSystem: (NSString *) os {
    NSLog(@"Установка операционной системы:%@ \n ",os);
}

// Установка операционной системы

- (NSString *) installOS {
    return @"Установка операционной системы успешно завершена\n";
}

//Присвоение хозяина ноутбуку

- (void) notebookOwner: (NSString *) name phoneNumber: (NSString *) phoneNumber countUser: (NSInteger) countUser {
    NSLog(@"Ноутбук был куплен: %@ \n Номер клиента: %@ \n Количество пользователей системы: %ld", name, phoneNumber, countUser);
}


//VIP упаковка старт
- (void) startPackaging {
    
    NSLog(@"Готовая продукция передана на VIP упаковку \n ");
    NSLog(@"VIP Упаковка готовой продукции начата \n ");
   
}

//VIP упаковка финишь

- (void) finishPackaging {
    
    NSLog(@"VIP Упаковка готовой продукции закончена успешно \n ");
    
}

@end

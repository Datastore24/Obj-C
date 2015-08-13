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

//Рандомное значение серийного номера ноутбука

- (NSString *) randomStringWithLength: (int) len {
    
   NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"; //строка для рандома
    
    NSMutableString *string = [NSMutableString stringWithCapacity: len]; //Строка длинной len
    
    for (NSUInteger i = 0; i < len; i++) {
        
        u_int32_t charIndex = arc4random() % [letters length]; //выбираем рандомный индекс буквы тип unsigned int
        
        unichar alpha = [letters characterAtIndex:charIndex]; // выбираем букву по индексу тип unsigned short
        
        [string appendFormat:@"%C", alpha]; //приводим в 16-битный Unicode символ формат и добавлени буквы или цифры в конец
    }
 
   return string;
}

//Рандомное значение серийного номера OS

- (NSString *) randomSnOs{
    
    NSString *letters = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"; //строка для рандома
    
    NSMutableString *string = [NSMutableString stringWithCapacity: 19]; //Строка длинной len
    
    for (NSUInteger i = 0; i < 4; i++) {
        
        for (NSUInteger i = 0; i < 4; i++) {
        u_int32_t charIndex = arc4random() % [letters length]; //выбираем рандомный индекс буквы тип unsigned int
        
        unichar alpha = [letters characterAtIndex:charIndex]; // выбираем букву по индексу тип unsigned short
        
        [string appendFormat:@"%C", alpha]; //приводим в 16-битный Unicode символ формат и добавлени буквы или цифры в конец
        }
        //Добавление дефиса всем элементам, кроме последнего
        if(i!=3){
            [string appendFormat:@"-"]; //Добавляем дефис
        }
    }
    
    return string;
}

// Выбор операционной системы

- (void) operationSystem: (int) os {
    
    switch (os){
        case 0:
            NSLog(@"Выбрана операционная система: Windows");
            break;
        case 1:
            NSLog(@"Выбрана операционная система: Linux");
            break;
            
        case 2:
            NSLog(@"Выбрана операционная система: Gentoo");
            break;
            
        default:
            NSLog(@"Выбрана операционная система: FreeDOS");
            break;
            
    }
    
    
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

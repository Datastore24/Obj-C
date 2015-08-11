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

// Выбор операционной системы

-(void) operationSystem: (NSString *) os {
    NSLog(@"Установка операционной системы:%@ \n ",os);
}

// Установка операционной системы

-(NSString *) installOS {
    return @"Установка операционной системы успешно завершена\n";
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

//
//  HumanDialog.m
//  Lesson3HW
//
//  Created by Кирилл Ковыршин on 15.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "HumanDialog.h"

@implementation HumanDialog

//Вывод приветствия
-(void) sayHello{
    NSLog(@"Добро пожаловать в центр статистики!\n Здесь мы изучим Ваши данные и они будут занесены в картотеку");
}


//Метод помещения целого числа в объект

-(NSInteger) integerToObject: (NSInteger) integer {
    NSString * objectString = [NSString stringWithFormat:@"%li",integer];
   
    NSInteger nonObjectInteger = [objectString integerValue];
    
    return nonObjectInteger;
}

//Метод помещения числа с плавающей точкой в объект

-(CGFloat) floatToObject: (CGFloat) cgfloat {
    NSString * objectString = [NSString stringWithFormat:@"%f",cgfloat];
    CGFloat nonObjectFloat = [objectString floatValue];
    return nonObjectFloat;
}

//Метод устанавливающий property и работа с массивом

-(void) startDialog: (NSString *) name
                sex: (NSString*)sex
                age: (NSInteger) age
             height: (CGFloat) height
             weight: (CGFloat) weight
      maritalStatus: (NSInteger) maritalStatus
 programmingLaguage: (NSString *) programmingLaguage{
    
    [self sayName:name];
    [self saySex:sex];
    [self sayAge:age];
    [self sayHeight:height];
    [self sayWeight:weight];
    [self sayMaritalStatus:maritalStatus sex:sex];
    [self sayProgrammingLaguage:programmingLaguage];
    
}

//Вспомогательные методы вывода и приведение типов

//Имя
- (void) sayName: (NSString*) name{
    
    NSLog(@"Назовите Ваша имя?\n");
    NSLog(@"%@\n\n",name);
    
}

//Пол
-(void) saySex: (NSString *) sex{

    NSLog(@"Ваш пол?\n");
    NSLog(@"%@\n\n",sex);
    
}

//Возраст
-(void) sayAge: (NSInteger) age{
    [self integerToObject:age];
    
    NSLog(@"Ваш возраст?\n");
    NSLog(@"%ld\n\n",age);
    
}

//Рост
-(void) sayHeight: (CGFloat) height{
    [self floatToObject:height];
    NSLog(@"Ваш рост?\n");
    NSLog(@"%f\n\n",height);
    
}

//Вес
-(void) sayWeight: (CGFloat) weight{
    [self floatToObject:weight];
    NSLog(@"Ваш вес?\n");
    NSLog(@"%f\n\n",weight);
    
}

//Метод с двумя условиями
-(void) sayMaritalStatus: (NSInteger) maritalStatus sex:(NSString *) sex{
    [self integerToObject:maritalStatus];
    NSLog(@"Ваш семейный статус?\n");
    if(maritalStatus == 0){
        if([sex  isEqual: @"Мужской"]){
            NSLog(@"Я не женат\n\n");
        }else{
            NSLog(@"Я не за мужем\n\n");
        }
        
    }else if(maritalStatus == 1){
        if([sex  isEqual: @"Мужской"]){
            NSLog(@"Я женат\n\n");
        }else{
            NSLog(@"Я замужем\n\n");
        }
        
    }else{
        NSLog(@"Ошибка ввода\n\n");
    }

    
}

//Языки программирования
-(void) sayProgrammingLaguage: (NSString *) programmingLaguage{
    
    NSLog(@"Язык программирования?\n");
    NSLog(@"%@\n\n",programmingLaguage);
    
}

//Методы вызываемые селектором с задержкой
-(void) studyData{
    NSLog(@"Изучение данных");
}

-(void) separator{
    NSLog(@"...");
}

-(void) studyDataFinish{
    NSLog(@"Изучение закончено");
}

-(void) addToDatabase{
    NSLog(@"Добавление данных в картатеку.");
}

//


@end

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


//Метод помещения целого числа в объект и обратное действие - приведение к примитивному типу

-(NSInteger) integerToObject: (NSInteger) integer {
    
    NSString * objectString = [NSString stringWithFormat:@"%li",integer]; // число в объект
    NSInteger nonObjectInteger = [objectString integerValue]; //обратно в примитив
    
    return nonObjectInteger;
}

//Метод помещения числа с плавающей точкой в объект и обратное действие - приведение к примитивному типу

-(CGFloat) floatToObject: (CGFloat) cgfloat {
    
    NSNumber * ObjectFloat = [NSNumber numberWithFloat:cgfloat]; // число в объект
    CGFloat nonObjectFloat = [ObjectFloat floatValue]; //обратно в примитив
    
    return nonObjectFloat;
}

//Основной метод для вывода процесса изучения человека

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

//Метод для работы с массивом

-(void) starDialogDictionary: (NSDictionary *) dictionary{
    
    //Обработка массива
    
    NSInteger intAge = [[dictionary objectForKey:@"dictAge"] integerValue];

    CGFloat floatHeight = [[dictionary objectForKey:@"dictHeight"] floatValue];
    
    CGFloat floatWeight = [[dictionary objectForKey:@"dictWeight"] floatValue];
    
    NSInteger intMarital = [[dictionary objectForKey:@"dictMarital"] integerValue];
    
    //
    
    NSLog(@"Обработка массива данных");
 
    [self performSelector:@selector(separator:) withObject:@"************************"]; //разделитель
    
    [self sayName:[dictionary objectForKey:@"dictName"]];
    [self saySex:[dictionary objectForKey:@"dictSex"]];
    [self sayAge:intAge];
    [self sayHeight:floatHeight];
    [self sayWeight:floatWeight];
    [self sayMaritalStatus:intMarital sex:[dictionary objectForKey:@"dictSex"]];
    [self sayProgrammingLaguage:[dictionary objectForKey:@"dictProgrammingLanguage"]];
    
    
    
}

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

//Разделитель
-(void) separator: (NSString *) separator{
    NSLog(@"%@",separator);
}

-(void) studyDataFinish{
    NSLog(@"Изучение закончено");
}

-(void) addToDatabase{
    NSLog(@"Добавление данных в картатеку.");
}

//


@end

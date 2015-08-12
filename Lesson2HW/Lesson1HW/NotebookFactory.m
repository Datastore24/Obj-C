//
//  NotebookFactory.m
//  Lesson1HW
//
//  Created by Кирилл Ковыршин on 07.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "NotebookFactory.h"

@implementation NotebookFactory

//Методы для вывода процесса изготовления

- (void) startFactory {
    NSLog(@"Добро пожаловать на фабрику ноутбуков Samsung \n ");
    NSLog(@"Начинаем изготовление компонентов \n ");
    [self factoryCase];
    [self factoryMotherboard];
    [self factoryHdd];
    [self factoryRam];
    [self factoryMatrix];
    [self factoryModules];
    
}


- (void) factoryCase {
    
    NSLog(@"Изготовление корпуса - успешно");
    
}

- (void) factoryMotherboard {
    
    NSLog(@"Изготовление материнской платы - успешно");
    
}

- (void) factoryHdd{
    
    NSLog(@"Изготовление жестко диска HDD - успешно");
    
}

- (void) factoryRam {
    
    NSLog(@"Изготовление оперативной памяти - успешно");
    
}

- (void) factoryMatrix {
    
    NSLog(@"Изготовление LED матрицы - успешно");
    
}

- (void) factoryModules {
    
    NSLog(@"Изготовление других модулей - успешно");
    
}


- (void) finishFactory {
    
    NSLog(@"Изготовление компонентов закончено успешно");
    
}

/* Конец методов вывода процесса изготовления
 
   Методы вывода процесса сборки

*/

- (void) startAssembly {
    
    NSLog(@"Компоненты переданы на сборку \n ");
    NSLog(@"Начинаем сборку \n ");
    
    [self installMotherboard];
    [self installHdd];
    [self installRam];
    [self installingMatrix];
    [self installingModules];
    
}

- (void) installMotherboard {
    
    NSLog(@"Установка материнской платы в корпус - успешно");
    
}

- (void) installHdd {
    
    NSLog(@"Установка жесткого диска + подключение - успешно");
    
}

- (void) installRam {
    
    NSLog(@"Установка оперативной памяти - успешно");
    
}


- (void) installingMatrix {
    
    NSLog(@"Установка LCD матрицы в корпус - успешно");
    
}

- (void) installingModules {
    
    NSLog(@"Установка других модулей - успешно");
    
}

- (void) finishAssembly {
    
    NSLog(@"Установка компонентов успешно завершена");
    
}

/* Конец вывода методов процесса сборки
   
   Методы вывода процесса упаковки
 
 */

- (void) startPackaging {
    
    NSLog(@"Готовая продукция передана на упаковку \n ");
    NSLog(@"Упаковка готовой продукции начата \n ");
    
}

- (void) finishPackaging {
    
    NSLog(@"Упаковка готовой продукции закончена успешно \n ");
    
}

// Конец методов вывода процеса упаковки



@end

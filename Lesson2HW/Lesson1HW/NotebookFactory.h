//
//  NotebookFactory.h
//  Lesson1HW
//
//  Created by Кирилл Ковыршин on 07.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotebookFactory : NSObject


//Объявление методов доступных пользователю (программисту)

- (void) startFactory; // Начало метода производства
- (void) finishFactory; // Конец метода производства, вывод статуса
- (void) startAssembly; // Начало метода сборки
- (void) finishAssembly; // Конец метода сборки, вывод статуса
- (void) startPackaging; // Начало метода упаковки
- (void) finishPackaging; // Конец метода упаковки, вывод статуса
- (NSInteger) countNotebook; //Рандомная функция вывода количества ноутбуков



@end

//
//  ViewController.m
//  Lesson3_ex
//
//  Created by Кирилл Ковыршин on 13.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // Примитивный типы данных - это числа и char
    int i = 0; //целое число
    float f = 1.5f; //с плавающий точкой
    double d = 1.5; //c плавающей точкой с увеличенной точностью
    BOOL bl = YES; //0 или 1
    
    NSInteger nsi = 1; // целое число + -
    NSUInteger nsui = 1; //только положительные значения целое
    CGFloat cgf = 1.5f; //с плавающей точкой
    
    CGRect rect; // прямоугольник
    CGPoint point; // точка
    CGSize size; // размер
    
    NSNumber * number = [NSNumber numberWithInteger:nsui]; //число в объект
    NSInteger gnum = [number integerValue]; //обратное
    
    NSString * str = [NSString stringWithFormat:@"%i", i]; // перевод в NSString
    NSInteger g = [str integerValue]; //обратное действие
    
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    id object; //Объект не определенного типа
    
    [self method];
    [self performSelector:@selector(method)]; //Вызов селектора
    [self performSelector:@selector(method) withObject:nil afterDelay:5.0]; //задержка вызова метода
   // [self performSelector:@selector(method:) withObject:@"String" afterDelay:5.0]; //передача объекта
   // [self performSelector:@selector(method:) withObject:@"String" withObject:@"2 String"];
    [self performSelectorInBackground:@selector(method) withObject:nil]; //Распараллелить задачу в другом потоке
    
}


- (void) method {
    NSLog(@"method");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

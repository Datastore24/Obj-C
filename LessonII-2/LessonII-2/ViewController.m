//
//  ViewController.m
//  LessonII-2
//
//  Created by Кирилл Ковыршин on 15.09.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIView * anotherView;
@property (assign, nonatomic) CGPoint dif;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UIButton * button;
//    UILabel * lebel;
//    
//    UIView * newView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    newView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:newView];
    
    [self addFiguresOnView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch * touch = [touches anyObject]; // берем тачи
    
    CGPoint pointOfTouch = [touch locationInView:self.view];
    
    UIView * touchView = [self.view hitTest:pointOfTouch withEvent:event]; // Определяем касание внутри view
    
    if(![touchView isEqual:self.anotherView]){
        
        self.anotherView = touchView;
        
        [self.view bringSubviewToFront:self.anotherView]; //Всегда
        
        CGPoint center = CGPointMake(CGRectGetMidX(self.anotherView.bounds), CGRectGetMidY(self.anotherView.bounds)); // вычиляем центр view
        
        CGPoint pointOfAnotherTouch = [touch locationInView:self.anotherView]; //касание на view
        
        self.dif = CGPointMake(center.x - pointOfAnotherTouch.x, center.y - pointOfAnotherTouch.y); // текущее касания от центра
        
        NSLog(@"Main View");
        
    }else{
        
        self.anotherView = nil;
        
        NSLog(@"Red View");
    
    }
    
    
    
//    NSLog(@"pointOfTouch when began %@",NSStringFromCGPoint(pointOfTouch));
    
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch * touch = [touches anyObject];
    
    CGPoint pointOfTouch = [touch locationInView:self.view];
    
    
    if(self.anotherView){
        CGPoint mainPoint = CGPointMake(pointOfTouch.x + self.dif.x, pointOfTouch.y + self.dif.y); //добавляем разницу касания от центра
        [UIView animateWithDuration:0.3 animations:^{
            self.anotherView.center = mainPoint; // новый центр
            self.anotherView.transform = CGAffineTransformMakeScale(1.3, 1.3); //Трансформация
            self.anotherView.alpha = 0.5; // прозрачность
        }];
        
        
    }
    

    
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [UIView animateWithDuration:0.3 animations:^{
        self.anotherView.transform = CGAffineTransformIdentity; //Трансформация, возвращает в исходное состояние
        self.anotherView.alpha = 1; // прозрачность
    }];

    
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    
    CGPoint pointOfTouch = [touch locationInView:self.view];
    
//    NSLog(@"pointOfTouch when Cancelled %@",NSStringFromCGPoint(pointOfTouch));
    
}

- (void) addFiguresOnView {
    
    NSMutableArray * images = [NSMutableArray array]; //массив
    NSFileManager * manager = [NSFileManager new]; //файл менеджер
    NSBundle * bundle = [NSBundle mainBundle]; //Корневая директория, в которой можно что-либо хранить
    NSDirectoryEnumerator * enumerator = [manager enumeratorAtPath:[bundle bundlePath]]; //Содержит в себе ключи атрибутов файлов, которые хранятся в директории
    NSLog(@"enumerator %@",enumerator.directoryAttributes);
 
    
    for (NSString * name in enumerator) {
        
        if([name hasSuffix:@".jpg"] || [name hasSuffix:@".png"] ){
            NSLog(@"name %@",name);
            UIImage * image = [UIImage imageNamed:name]; //создание объекта
            [images addObject:image]; //Добавление в массив
        }
    }
    
    for (int i=0; i<images.count; i++) {
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)]; //Создаем объект view
//        view.userInteractionEnabled =NO; //Отключение воспринятие на тач
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:view.bounds]; //Помещаем изображение во view.bounds
        imageView.image = [images objectAtIndex:i]; //Присваиваем изображение из массива
        
        [view addSubview:imageView]; //Отрисовываем изображение во view
        [self.view addSubview:view]; //Отрисовываем view на экран
    }
    
    
}

@end

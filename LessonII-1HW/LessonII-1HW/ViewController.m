//
//  ViewController.m
//  LessonII-1HW
//
//  Created by Кирилл Ковыршин on 12.09.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "ViewController.h"
#import "Animations.h"

@interface ViewController (){
    BOOL isButton;
}
@property (weak, nonatomic) IBOutlet UIButton *buttonLeft;
@property (weak, nonatomic) IBOutlet UIButton *buttonRight;
@property (weak, nonatomic) IBOutlet UIImageView *imageSushi;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    isButton = YES; //Стостояние кнопки по умоляанию
    self.buttonLeft.alpha=0; //Прозрачность левой кнопки по умолчанию
    
    self.buttonLeft.layer.borderColor=[UIColor whiteColor].CGColor; //Цвет бордера кнопки по умолчанию
    self.buttonLeft.layer.borderWidth=4; //Размер бордера
    self.buttonLeft.layer.backgroundColor=[UIColor redColor].CGColor; //Цвет кнопки по умолчанию
    self.buttonLeft.clipsToBounds = YES; //Обрезаем действие кнопки по контуру
    self.buttonLeft.layer.cornerRadius=46/2.0f; //Округляем кнопку
    
    self.buttonRight.layer.borderColor=[UIColor whiteColor].CGColor; //Цвет бордера кнопки по умолчанию
    self.buttonRight.layer.borderWidth=4; //Размер бордера
    self.buttonRight.layer.backgroundColor=[UIColor redColor].CGColor;//Цвет кнопки по умолчанию
    self.buttonRight.clipsToBounds = YES; //Обрезаем действие кнопки по контуру
    self.buttonRight.layer.cornerRadius=46/2.0f; //Округляем кнопку
    
    //Вызов методов для кнопок
    [self.buttonLeft addTarget:self action:@selector(clickLeftButton) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonRight addTarget:self action:@selector(clickRightButton) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void) clickLeftButton {
    if(!isButton){
        isButton = YES; // Статус кнопки
        [Animations animationView:self.buttonLeft withColor:[UIColor blueColor]]; //меняем цвет левой кнопки
        [Animations animationView:self.buttonRight withColor:[UIColor redColor]]; //меняем цвет правой кнопки
        
        //трансформируем изображение
        [Animations animateTransformView:self.imageSushi withScale:1.0 move_X:-100 move_Y:0.0 alpha:1 delay:0.4];
    }
    
}

- (void) clickRightButton {
    
    if(isButton){
        isButton = NO;
        [Animations animationView:self.buttonRight withColor:[UIColor blueColor]]; //меняем цвет левой кнопки
        [Animations animationView:self.buttonLeft withColor:[UIColor redColor]]; //меняем цвет левой кнопки
        [Animations animationView:self.buttonLeft withAlpha:1]; //Меняем видимость левой кнопки
        
        //трансформируем изображение
        [Animations animateTransformView:self.imageSushi withScale:1.0 move_X:100 move_Y:0.0 alpha:1 delay:0.4];
        
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  LessonII-2HW
//
//  Created by Кирилл Ковыршин on 15.09.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+HexColors.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
    
    //Добавление фона
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
    //Отображение досок для съеденных фигур
    UIImageView *deskImage = [[UIImageView alloc] initWithFrame:CGRectMake(730, 54, 300, 300)];
    [deskImage setImage:[UIImage imageNamed:@"desk.png"]];
    [self.view addSubview:deskImage];
    UIImageView *deskImageOfEnemy = [[UIImageView alloc] initWithFrame:CGRectMake(730, 420, 300, 300)];
    [deskImageOfEnemy setImage:[UIImage imageNamed:@"desk.png"]];
    [self.view addSubview:deskImageOfEnemy];
    
    //Создание доски
    [self createAChessboard];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)createAChessboard {
  int g = 0; //вспомогательный счетчик, для отсчета 8 клеток и переход на новую строку
  int coordX = 0; //Вспомогательный счетчик отступа по X
  int coordY = 0; //Вспомогательный счетчик отступа по Y
  NSString *colorOfBox;

  //Цикл построения клеток доски
  for (int i = 0; i < 64; i++) {

    //Подсчет количества ячеек в строке, смещение view
    if (g == 8) {
      coordY += 80; // Добавляем отступ
      coordX = 0; // Обнуляем отступ по Х
      g = 0; //Обнуляем вспомогательный счетчик клеток доски в строке
    }
    //Построение цвета шахматной доски
    int countOfLine = i / 8; //Определяем количество строк
    //Чередования цвета строк
    if (countOfLine % 2) {
        //Чередования цвета клеток в одной строке
      if (i % 2) {
        colorOfBox = @"e1be62";
      } else {
        colorOfBox = @"8a5a10";
      }
    } else {
        //Чередования цвета клеток в одной строке
      if (i % 2) {
        colorOfBox = @"8a5a10";
      } else {
        colorOfBox = @"e1be62";
      }
    }
    //

    // Cоздания ячейки шахматной доски
    UIView *view = [[UIView alloc]
        initWithFrame:CGRectMake(60 + coordX, 64 + coordY, 80, 80)];  //Создание клетки
    view.backgroundColor = [UIColor colorWithHexString:colorOfBox]; //Установка цвета
    view.layer.borderColor = [UIColor blackColor].CGColor;//Установка цвета рамки
    view.layer.borderWidth = 1; //Ширина рамки
    [self.view addSubview:view]; //Отрисовка на экране
      
     

    //Отступ
    coordX += 80;
    //Количество ячеек
    g++;
  }
    int coordNumericX=0; //Вспомогательный счетчик отступа по оси X
    for (int i=0; i<8; i++) {
        //Создание цифр на доске
        UILabel * numericLabel = [[UILabel alloc] initWithFrame:CGRectMake(90+coordNumericX, 720, 20, 20)];
        numericLabel.text = [NSString stringWithFormat:@"%i",i+1];//Берем цифру из счетчика кроме 0
        numericLabel.backgroundColor = [UIColor whiteColor]; //Цвет
        numericLabel.alpha = 0.6;//Прозрачность
        numericLabel.font = [UIFont systemFontOfSize:18];//Шрифт
        numericLabel.textAlignment = NSTextAlignmentCenter;//Цинтровка
        
        [self.view addSubview:numericLabel];
        //
        
        //Перевернутые цифры
        UILabel * numericFlipLabel = [[UILabel alloc] initWithFrame:CGRectMake(90+coordNumericX, 32, 20, 20)];
        numericFlipLabel.text = [NSString stringWithFormat:@"%i",i+1];
        numericFlipLabel.backgroundColor = [UIColor whiteColor];
        numericFlipLabel.alpha = 0.6;
        numericFlipLabel.font = [UIFont systemFontOfSize:18];
        numericFlipLabel.textAlignment = NSTextAlignmentCenter;
        [numericFlipLabel setTransform:CGAffineTransformMakeRotation(-M_PI / 1)]; //Переворот цифер
        
        [self.view addSubview:numericFlipLabel];
        coordNumericX += 80;//Добавляем отступ
        
    }
    
    int coordAlphabetY = 0;//Вспомогательный счетчик отступа по оси Y
    //Цикл генерирующий буквы для доски
    for (char a = 'A'; a <= 'H'; a++)
    {

        UILabel * letterLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 90+coordAlphabetY, 20, 20)];
        letterLabel.text = [NSString stringWithFormat:@"%c", a];
        letterLabel.backgroundColor = [UIColor whiteColor];
        letterLabel.alpha = 0.6;
        letterLabel.font = [UIFont systemFontOfSize:18];
        letterLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.view addSubview:letterLabel];
        
        
        UILabel * letterFlipLabel = [[UILabel alloc] initWithFrame:CGRectMake(720, 90+coordAlphabetY, 20, 20)];
        letterFlipLabel.text = [NSString stringWithFormat:@"%c", a];
        letterFlipLabel.backgroundColor = [UIColor whiteColor];
        letterFlipLabel.alpha = 0.6;
        letterFlipLabel.font = [UIFont systemFontOfSize:18];
        letterFlipLabel.textAlignment = NSTextAlignmentCenter;
        [letterFlipLabel setTransform:CGAffineTransformMakeRotation(-M_PI / 1)]; //Переворот букв
        [self.view addSubview:letterFlipLabel];
        
        coordAlphabetY += 80; //Добавляем отступ
        
    }
}

@end

//
//  ViewController.m
//  LessonII-2HW
//
//  Created by Кирилл Ковыршин on 15.09.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+HexColors.h"
#import "AFSoundManager.h"

@interface ViewController ()

@property(strong, nonatomic) NSMutableArray *squaresBoardArray;
@property(strong, nonatomic) NSMutableDictionary *imagesMArray;
@property(strong, nonatomic) UIView *anotherView;
@property(assign, nonatomic) CGPoint dif;
@property(assign, nonatomic) UIButton *musicButton;

//Для плеера
@property (nonatomic, strong) AFSoundPlayback *playback;
@property (nonatomic, strong) AFSoundQueue *queue;
@property (nonatomic, strong) NSMutableArray *items;
//

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  //Добавление фона
  self.view.backgroundColor =
      [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
  //Отображение досок для съеденных фигур
  UIImageView *deskImage =
      [[UIImageView alloc] initWithFrame:CGRectMake(730, 54, 300, 300)];

  [deskImage setImage:[UIImage imageNamed:@"desk.png"]];

  [self.view addSubview:deskImage];

  UIImageView *deskImageOfEnemy =
      [[UIImageView alloc] initWithFrame:CGRectMake(730, 420, 300, 300)];
  [deskImageOfEnemy setImage:[UIImage imageNamed:@"desk.png"]];

  [self.view addSubview:deskImageOfEnemy];

  //Создание доски
  [self createAChessboard];
  [self addFigureImageToArray];
  [self addFigureOnTheBoard];

  //Проигрывание музыки
     AFSoundItem *item1 = [[AFSoundItem alloc] initWithLocalResource:@"classic.mp3" atPath:nil];
     self.items = [NSMutableArray arrayWithObjects:item1, nil];
    self.queue = [[AFSoundQueue alloc] initWithItems:self.items];
    [self.queue playCurrentItem];
    

  UIButton *playMusicButton =
      [[UIButton alloc] initWithFrame:CGRectMake(760, 725, 32, 32)];
  playMusicButton.backgroundColor =
      [UIColor colorWithPatternImage:[UIImage imageNamed:@"pause.png"]];

  [playMusicButton addTarget:self
                      action:@selector(pauseMusic)
            forControlEvents:UIControlEventTouchUpInside];
  self.musicButton = playMusicButton;
  [self.view addSubview:playMusicButton];

  UILabel *labelMusic =
      [[UILabel alloc] initWithFrame:CGRectMake(800, 710, 400, 50)];
  labelMusic.text = @"Музыка";
  labelMusic.textColor = [UIColor colorWithHexString:@"ffd800"];
  labelMusic.font = [UIFont fontWithName:@"Snell Roundhand" size:42];
  labelMusic.shadowColor = [UIColor whiteColor];

  [self.view addSubview:labelMusic];
    
  //
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

//Метод плеера

-(void)playMusic{
    [self.queue playCurrentItem];
        [UIView
            animateWithDuration:0.5
                     animations:^{
                       self.musicButton.backgroundColor = [UIColor
                           colorWithPatternImage:[UIImage imageNamed:@"pause.png"]];
                       [self.musicButton addTarget:self
                                            action:@selector(pauseMusic)
                                  forControlEvents:UIControlEventTouchUpInside];
                     }];
}

-(void)pauseMusic{
    [self.queue pause];
    [UIView
             animateWithDuration:0.5
                      animations:^{
                        self.musicButton.backgroundColor = [UIColor
                            colorWithPatternImage:[UIImage imageNamed:@"play.png"]];
                        [self.musicButton addTarget:self
                                             action:@selector(playMusic)
                                   forControlEvents:UIControlEventTouchUpInside];
                      }];
}

- (void)createAChessboard {
  int g = 0; //вспомогательный счетчик, для отсчета 8 клеток и переход на новую
             //строку
  int coordX = 0; //Вспомогательный счетчик отступа по X
  int coordY = 0; //Вспомогательный счетчик отступа по Y
  NSString *colorOfBox; //Цвет клетки
  NSMutableArray *squaresBoardArray =
      [[NSMutableArray alloc] init]; //Массив для клеток

  //Цикл построения клеток доски
  for (int i = 0; i < 64; i++) {

    //Подсчет количества ячеек в строке, смещение view
    if (g == 8) {
      coordY += 80; // Добавляем отступ
      coordX = 0;   // Обнуляем отступ по Х
      g = 0;        //Обнуляем вспомогательный счетчик клеток доски в строке
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
    UIView *squareView =
        [[UIView alloc] initWithFrame:CGRectMake(60 + coordX, 64 + coordY, 80,
                                                 80)]; //Создание клетки
    squareView.userInteractionEnabled = NO;
    squareView.backgroundColor =
        [UIColor colorWithHexString:colorOfBox]; //Установка цвета
    squareView.layer.borderColor =
        [UIColor blackColor].CGColor; //Установка цвета рамки
    squareView.layer.borderWidth = 1; //Ширина рамки
    [self.view addSubview:squareView]; //Отрисовка на экране
    //Добавление координат ячейки в массив
    CGPoint center =
        CGPointMake(CGRectGetMinX(squareView.frame),
                    CGRectGetMinY(squareView.frame)); // вычиляем центр клетки

    [squaresBoardArray
        addObject:[NSValue valueWithCGPoint:center]]; //Добавлем координату в
                                                      //массив

    //Отступ
    coordX += 80;
    //Количество ячеек
    g++;
  }
  self.squaresBoardArray = squaresBoardArray; //Область видимости массива клеток

  int coordNumericY = 0; //Вспомогательный счетчик отступа по оси X
  for (int i = 7; i >= 0; i--) {
    //Создание цифр на доске
    UILabel *numericLabel = [[UILabel alloc]
        initWithFrame:CGRectMake(15, 90 + coordNumericY, 20, 20)];
    numericLabel.text = [NSString
        stringWithFormat:@"%i", i + 1]; //Берем цифру из счетчика кроме 0
    numericLabel.backgroundColor = [UIColor whiteColor]; //Цвет
    numericLabel.alpha = 0.6;                         //Прозрачность
    numericLabel.font = [UIFont systemFontOfSize:18]; //Шрифт
    numericLabel.textAlignment = NSTextAlignmentCenter; //Цинтровка

    [self.view addSubview:numericLabel];
    //

    //Перевернутые цифры
    UILabel *numericFlipLabel = [[UILabel alloc]
        initWithFrame:CGRectMake(720, 90 + coordNumericY, 20, 20)];
    numericFlipLabel.text = [NSString stringWithFormat:@"%i", i + 1];
    numericFlipLabel.backgroundColor = [UIColor whiteColor];
    numericFlipLabel.alpha = 0.6;
    numericFlipLabel.font = [UIFont systemFontOfSize:18];
    numericFlipLabel.textAlignment = NSTextAlignmentCenter;
    [numericFlipLabel setTransform:CGAffineTransformMakeRotation(
                                       -M_PI / 1)]; //Переворот цифер

    [self.view addSubview:numericFlipLabel];
    coordNumericY += 80; //Добавляем отступ
  }

  int coordAlphabetX = 0; //Вспомогательный счетчик отступа по оси Y
  //Цикл генерирующий буквы для доски
  for (char a = 'A'; a <= 'H'; a++) {

    UILabel *letterLabel = [[UILabel alloc]
        initWithFrame:CGRectMake(90 + coordAlphabetX, 720, 20, 20)];
    letterLabel.text = [NSString stringWithFormat:@"%c", a];
    letterLabel.backgroundColor = [UIColor whiteColor];
    letterLabel.alpha = 0.6;
    letterLabel.font = [UIFont systemFontOfSize:18];
    letterLabel.textAlignment = NSTextAlignmentCenter;

    [self.view addSubview:letterLabel];

    UILabel *letterFlipLabel = [[UILabel alloc]
        initWithFrame:CGRectMake(90 + coordAlphabetX, 32, 20, 20)];
    letterFlipLabel.text = [NSString stringWithFormat:@"%c", a];
    letterFlipLabel.backgroundColor = [UIColor whiteColor];
    letterFlipLabel.alpha = 0.6;
    letterFlipLabel.font = [UIFont systemFontOfSize:18];
    letterFlipLabel.textAlignment = NSTextAlignmentCenter;
    [letterFlipLabel
        setTransform:CGAffineTransformMakeRotation(-M_PI / 1)]; //Переворот букв
    [self.view addSubview:letterFlipLabel];

    coordAlphabetX += 80; //Добавляем отступ
  }
}

- (void)addFigureImageToArray {
  NSMutableDictionary *imagesMArray = [[NSMutableDictionary alloc] init];
  NSFileManager *manager = [NSFileManager new]; //файл менеджер
  NSBundle *bundle = [NSBundle mainBundle]; //Корневая директория, в которой
  //можно что-либо хранить
  NSDirectoryEnumerator *enumerator =
      [manager enumeratorAtPath:[bundle bundlePath]]; //Содержит в себе ключи
  //атрибутов файлов,
  //которые хранятся в
  //директории
  for (NSString *name in enumerator) {
    //Положение пешки
    if ([name hasSuffix:@"_b.png"] || [name hasSuffix:@"_w.png"]) {
      NSString *nameOfFigure =
          [name stringByReplacingOccurrencesOfString:@".png" withString:@""];
      [imagesMArray setObject:name forKey:nameOfFigure];
    }
  }
  self.imagesMArray = imagesMArray;
}

- (void)addFigureOnTheBoard {

  for (NSString *key in self.imagesMArray) {
    id value = [self.imagesMArray objectForKey:key];
    if ([key hasPrefix:@"pawn_b"]) {

      for (int i = 1; i < 9; i++) {

        //Черные пешки
        [self addFigureImageView:7 andImage:value andI:i];

        //
      }

    } else if ([key isEqualToString:@"pawn_w"]) {
      //Белые пешки
      for (int i = 1; i < 9; i++) {
        [self addFigureImageView:47 andImage:value andI:i];
      }
    } else if ([key isEqualToString:@"rook_b"]) {

      [self addFigureImageView:0 andImage:value andI:0];
      [self addFigureImageView:7 andImage:value andI:0];

    } else if ([key isEqualToString:@"rook_w"]) {

      [self addFigureImageView:56 andImage:value andI:0];
      [self addFigureImageView:63 andImage:value andI:0];

    } else if ([key isEqualToString:@"horse_b"]) {

      [self addFigureImageView:1 andImage:value andI:0];
      [self addFigureImageView:6 andImage:value andI:0];

    } else if ([key isEqualToString:@"horse_w"]) {

      [self addFigureImageView:57 andImage:value andI:0];
      [self addFigureImageView:62 andImage:value andI:0];

    } else if ([key isEqualToString:@"elephant_b"]) {

      [self addFigureImageView:2 andImage:value andI:0];
      [self addFigureImageView:5 andImage:value andI:0];

    } else if ([key isEqualToString:@"elephant_w"]) {

      [self addFigureImageView:58 andImage:value andI:0];
      [self addFigureImageView:61 andImage:value andI:0];

    } else if ([key isEqualToString:@"qeen_b"]) {

      [self addFigureImageView:3 andImage:value andI:0];

    } else if ([key isEqualToString:@"qeen_w"]) {

      [self addFigureImageView:59 andImage:value andI:0];

    } else if ([key isEqualToString:@"king_b"]) {

      [self addFigureImageView:4 andImage:value andI:0];

    } else if ([key isEqualToString:@"king_w"]) {

      [self addFigureImageView:60 andImage:value andI:0];
    }
  }
}

//Метод располагающий картинки на доске
- (void)addFigureImageView:(int)index andImage:(NSString *)value andI:(int)i {

  CGPoint coordOfSquare = CGPointMake(
      [[self.squaresBoardArray objectAtIndex:index + i] CGPointValue].x,
      [[self.squaresBoardArray objectAtIndex:index + i] CGPointValue].y);

  UIView *figureView = [[UIView alloc]
      initWithFrame:CGRectMake(coordOfSquare.x, coordOfSquare.y + 2, 75,
                               75)]; //Создаем объект view

  UIImageView *figureImageView = [[UIImageView alloc]
      initWithFrame:figureView.bounds]; //Помещаем изображение во
  // view.bounds
  figureImageView.image =
      [UIImage imageNamed:value]; //Присваиваем изображение из массива

  [figureView addSubview:figureImageView]; //Отрисовываем изображение во
  // view
  [self.view addSubview:figureView]; //Отрисовываем view на экран
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

  UITouch *touch = [touches anyObject];
  CGPoint pointOfTouch = [touch locationInView:self.view];
  UIView *touchView = [self.view hitTest:pointOfTouch withEvent:event];

  if (![touchView isEqual:self.view]) {

    self.anotherView = touchView;

    [self.view bringSubviewToFront:self.anotherView]; //Слой всегда сверху, за
    //который тянем

    CGPoint center = CGPointMake(
        CGRectGetMidX(self.anotherView.bounds),
        CGRectGetMidY(self.anotherView.bounds)); // вычиляем центр view

    CGPoint pointOfAnotherTouch =
        [touch locationInView:self.anotherView]; //касание на view

    self.dif = CGPointMake(
        center.x - pointOfAnotherTouch.x,
        center.y - pointOfAnotherTouch.y); // текущее касания от центра

  } else {

    self.anotherView = nil;
  }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {

  UITouch *touch = [touches anyObject]; // Все кассания
  CGPoint pointOfTouch = [touch locationInView:self.view]; //Точка касания

  if (self.anotherView) {
    CGPoint mainPoint = CGPointMake(
        pointOfTouch.x + self.dif.x,
        pointOfTouch.y + self.dif.y); //добавляем разницу касания от центра
    [UIView animateWithDuration:0.3
                     animations:^{
                       self.anotherView.center = mainPoint; // новый центр
                       self.anotherView.transform =
                           CGAffineTransformMakeScale(1.3, 1.3); //Трансформация
                       self.anotherView.alpha = 0.5; // прозрачность
                     }];
  }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

  [UIView animateWithDuration:0.3
                   animations:^{
                     self.anotherView.transform =
                         CGAffineTransformIdentity; //Трансформация, возвращает
                     //в исходное состояние
                     self.anotherView.alpha = 1; // прозрачность
                   }];
}

@end

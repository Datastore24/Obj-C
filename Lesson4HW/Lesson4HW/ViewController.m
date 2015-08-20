//
//  ViewController.m
//  Lesson4HW
//
//  Created by Кирилл Ковыршин on 19.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "ViewController.h"
#import "Users.h"
#import "Shop.h"
#import "ShowUsers.h"

@interface ViewController ()

@property(weak, nonatomic) IBOutlet UIButton *makeOrder;

@property(weak, nonatomic) IBOutlet UIButton *enter;

@property(weak, nonatomic) IBOutlet ShowUsers *showUsers;

@property(strong, nonatomic) Shop *shop;
@property(strong, nonatomic) Users *users;
@property(strong, nonatomic) NSMutableArray *usersArray;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  Shop *shop = [Shop new];
  self.shop = shop; //Область видимости объекта SHOP

  Users *users = [Users new];
  self.users = users; // Область видимости объекта Users

  NSLog(@"Добро пожаловать в %@! Наш телефон:%@",
        shop.sName, shop.sPhone); //Приветствие

  [self.makeOrder setEnabled:NO]; // Деактивируем кнопку по умолчанию

  //Устнавливаем property
  [self.users setUsers:@"oxyfire"
             uPassword:@"123"
                 uName:@"Ковыршин Кирилл"
                  uAge:28
                 uSize:46L
                uEmail:@"co@datastore24.ru"];

  NSDictionary *userOxyfire = [[NSDictionary alloc]
      initWithObjectsAndKeys:@"oxyfire", @"user", @"123", @"password",
                             @"Ковыршин Кирилл", @"name",
                             nil]; //Коллекция  1 пользователя
  NSDictionary *userOlga = [[NSDictionary alloc]
      initWithObjectsAndKeys:@"olga", @"user", @"321", @"password",
                             @"Ковыршина Ольга", @"name",
                             nil]; //Коллекция 2 пользователя
  NSMutableArray *mUsers = [[NSMutableArray alloc] init]; //Изменяемы массив
  [mUsers addObject:userOxyfire]; //Добавление коллекции в массив
  [mUsers addObject:userOlga]; // Добавление коллекции в массив

  self.showUsers.array =
      mUsers; // Помещаем массив в proparty расширяем область видимости

  [self.showUsers addTarget:self
                     action:@selector(showAllUsers)
           forControlEvents:UIControlEventTouchUpInside]; //Действия на кнопка
}

//Метод для кнопки вход
- (IBAction)Enter:(id)sender {

  NSLog(
      @"Вы вошли как: %@ [%@]! \n\n Пароль: %@ \n Вам: %li лет "
      @"\n " @"Ваш " @"размер: %li \n E-mail:%@",
      self.users.uName, self.users.uLogin, self.users.uPassword,
      self.users.uAge, self.users.uSize, self.users.uEmail);
  [self.makeOrder setEnabled:YES]; // Активируем кнопку
  [self.enter setEnabled:NO];      // Деактивируем кнопку
}

//Метод для кнопки заказа
- (IBAction)makeOrder:(id)sender {
  NSArray *shopItems = [[NSArray alloc]
      initWithArray:[self.shop shopItems]]; //Инициализируем массив из property
  NSDictionary *itemsPrice = [[NSDictionary alloc]
      initWithDictionary:[self.shop itemsPrice]]; //Инициализируем коллекцию из
  // property

  //Цикл для обработки наименование товара - цена
  for (int i = 0; shopItems.count > i; i++) {

    NSString *itemKey = [NSString
        stringWithFormat:@"%@", [shopItems objectAtIndex:i]]; // Дергаем
    // название товара
    NSString *items = [NSString
        stringWithFormat:@"%@ %@ руб.", [shopItems objectAtIndex:i],
                         [itemsPrice objectForKey:itemKey]]; //Формирование
                                                             //строки
    //Наименование -
    //Цена руб.
    NSLog(@"%@", items); // Вывод строки
  }
}

//Метод для кнопки вывод всех пользователей
- (IBAction)showAllUsers {

  //Вывоз метода обработки массива
  [self arrayProcessing:self.showUsers.array];

  //
}

//Обработка двумерного массива
- (void)arrayProcessing:(NSMutableArray *)usersArray {

  for (int i = 0; usersArray.count > i; i++) {

    //Цикл по ключам с выводом в консоль строки
    for (NSString *key in [[usersArray objectAtIndex:i] allKeys]) {
      NSLog(@"%@ = %@", key, [[usersArray objectAtIndex:i] objectForKey:key]); //Вывод строки
    }
    NSLog(@"---------"); //разделитель
  }
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end

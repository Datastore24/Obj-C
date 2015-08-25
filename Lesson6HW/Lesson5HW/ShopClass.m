//
//  ShopClass.m
//  Lesson5HW
//
//  Created by Кирилл Ковыршин on 23.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "ShopClass.h"

@implementation ShopClass

//Данные о магазине в виде массива
- (NSArray *)welcome {
  self.sName = @"Магазин Одежды";
  self.sPhone = @"+7 499 713 59 17";

  NSString *welcomeString = [NSString
      stringWithFormat:@"Добро пожаловать в %@!", self.sName];
  NSString *phoneString =
      [NSString stringWithFormat:@"Наш телефон:%@", self.sPhone];
  NSArray *welcomePhoneArray =
      [[NSArray alloc] initWithObjects:welcomeString, phoneString, nil];

  return welcomePhoneArray;
}

//Не скрытый метод получения массива товаров и цены
- (void)getShop {

  NSMutableArray *itemsPriceArray = [[NSMutableArray alloc] init];

  NSArray *itemsArray = [[NSArray alloc]
      initWithObjects:@"Джинсы", @"Куртка", @"Свитер",
                      @"Майка", @"Футболка", nil];
  NSArray *priceArray = [[NSArray alloc]
      initWithObjects:@"2500 руб.", @"5000  руб.", @"1250  руб.", @"650  руб.",
                      @"350  руб.", nil];
  for (int i = 0; i < priceArray.count; i++) {
    NSDictionary *dict = [[NSDictionary alloc]
        initWithObjectsAndKeys:[itemsArray objectAtIndex:i], @"items",
                               [priceArray objectAtIndex:i], @"price", nil];

    [itemsPriceArray addObject:dict];
  }
    NSDictionary * dictNotification = [[NSDictionary alloc] initWithObjectsAndKeys:
                                       itemsPriceArray,@"array", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_WHEN_ITEMS_IS_LOADED object:nil userInfo:dictNotification];

}


//Массив пользователей
- (void)getUsers {

  NSMutableArray *mUsers = [[NSMutableArray alloc] init]; //Изменяемый массив
  //Пользователи
  NSArray *uLogin = [[NSArray alloc]
      initWithObjects:@"oxyfire", @"kovolga", @"Dasha", @"Viktor", nil];

  //Пароли
  NSArray *uPassword = [[NSArray alloc]
      initWithObjects:@"123", @"0909", @"4943439", @"pass", nil];
  //Ф.И.О
  NSArray *uName = [[NSArray alloc]
      initWithObjects:@"Ковыршин Кирилл",
                      @"Ковыршина Ольга", @"Дарья",
                      @"Доганов Виктор", nil];

  //Почта
  NSArray *uEmail = [[NSArray alloc]
      initWithObjects:@"co@datastore24.ru", @"olga@vmecte.ru", @"dasha@mail.ru",
                      @"viktor84@bk.ru", nil];
  //Изображения
  NSArray *uAvatar =
      [[NSArray alloc] initWithObjects:@"Kirill.jpg", @"Olga.jpg", @"dasha.jpg",
                                       @"anonym.png", nil];

  //Создание единого массива данных
  for (int i = 0; i < uLogin.count; i++) {
    NSDictionary *dict = [[NSDictionary alloc]
        initWithObjectsAndKeys:[uLogin objectAtIndex:i], @"uLogin",
                               [uPassword objectAtIndex:i], @"uPassword",
                               [uName objectAtIndex:i], @"uName",
                               [uEmail objectAtIndex:i], @"uEmail",
                               [uAvatar objectAtIndex:i], @"uAvatar", nil];
    [mUsers addObject:dict];
  }

 NSDictionary * dictNotification = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    mUsers,@"array", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_WHEN_USERS_IS_LOADED object:nil userInfo:dictNotification];
}


@end

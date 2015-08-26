//
//  ViewController.m
//  Lesson5HW
//
//  Created by Кирилл Ковыршин on 23.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "ViewController.h"
#import "ShopClass.h"
#import "CustomTableViewCell.h"

@interface ViewController () <ShopClassDelegate, UITableViewDataSource,
                              UITableViewDelegate>

@property(weak, nonatomic) IBOutlet UILabel *welcomeText;
@property(weak, nonatomic) IBOutlet UILabel *phoneNumber;
@property(weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong, nonatomic) NSMutableArray *arrayData;
@property(weak, nonatomic) IBOutlet UIButton *userButton;
@property(weak, nonatomic) IBOutlet UIButton *shopButton;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  [[NSNotificationCenter defaultCenter]
      addObserver:self
         selector:@selector(reloadTableView:)
             name:NOTIFICATION_WHEN_ITEMS_IS_LOADED
           object:nil];
  [[NSNotificationCenter defaultCenter]
      addObserver:self
         selector:@selector(reloadTableView:)
             name:NOTIFICATION_WHEN_USERS_IS_LOADED
           object:nil];

  //Фоновое изображение для TableView --------------------------------------//
  UIImageView *tempImageView =
      [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fonTable.jpg"]];
  [tempImageView setFrame:self.tableView.frame];

  self.tableView.backgroundView = tempImageView;
  self.tableView.tableFooterView = [[UIView alloc] init];

  //------------------------------------------------------------------------//

  ShopClass *protocol = [ShopClass new]; // Объект класса ShopClass
  NSArray *welcomePhoneArray = [[NSArray alloc]
      initWithArray:[protocol welcome]]; //Массив с приветствием

  //Приветствие
  NSString *welcomeText =
      [NSString stringWithFormat:@"%@", [welcomePhoneArray objectAtIndex:0]];

  //Телефон
  NSString *phoneText =
      [NSString stringWithFormat:@"%@", [welcomePhoneArray objectAtIndex:1]];

  //Помещаем на экран
  self.welcomeText.text = welcomeText;
  self.phoneNumber.text = phoneText;

  // Do any additional setup after loading the view, typically from a nib.
}

- (void)dealloc {
  [[NSNotificationCenter defaultCenter]
      removeObserver:self]; // отписываемся от нотификаций
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

//Действие для кнопки Магазин
- (IBAction)clickShopButton:(id)sender {

  ShopClass *protocol = [ShopClass new]; // создание объекта
  [protocol performSelector:@selector(getShop)
                 withObject:nil
                 afterDelay:0.5]; // Вызываем метод с задержкой
}

//Действие для кнопки Пользователи
- (IBAction)clickUsersButton:(id)sender {

  ShopClass *protocol = [ShopClass new]; // создание объекта
  [protocol performSelector:@selector(getUsers)
                 withObject:nil
                 afterDelay:0.5]; // Вызываем метод с задержкой
}

#pragma mark - ShopClassDelegate
//Обновления ячеек с анимацией
- (void)reloadTableView:(NSNotification *)notification {
  NSArray *array = [notification.userInfo objectForKey:@"array"];

  [self.arrayData removeAllObjects];

  self.arrayData = [[NSMutableArray alloc] initWithArray:array];

  [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0]
                withRowAnimation:UITableViewRowAnimationLeft];
}

#pragma mark - UITableViewDataSource

//Расчет количества ячеек (обязательный метод UITableViewDataSource)
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {

  return self.arrayData.count;
}

// Устанавливаем высоту ячейки, для каждой ячейки свою
- (CGFloat)tableView:(UITableView *)tableView
    heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSDictionary *dict = [self.arrayData objectAtIndex:indexPath.row];

  if ([dict objectForKey:@"uLogin"]) {
    return 155.f;
  } else {
    return 50.f;
  }
}

//Отрисовываем ячейки (цикл) (обязательный метод UITableViewDataSource)
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {

  static NSString *identifierItems = @"Cell";
  static NSString *identifierUser = @"User";
  NSDictionary *dict = [self.arrayData objectAtIndex:indexPath.row];
  if ([dict objectForKey:@"uLogin"]) {
    CustomTableViewCell *cell = (CustomTableViewCell *)
        [tableView dequeueReusableCellWithIdentifier:identifierUser
                                        forIndexPath:indexPath];

    cell.uNameLabel.text = [dict objectForKey:@"uName"];
    cell.uNameLabel.textColor = [UIColor whiteColor]; //Цвет текста

    cell.uLoginLabel.text = [dict objectForKey:@"uLogin"];
    cell.uLoginLabel.textColor = [UIColor whiteColor];//Цвет текста

    cell.uPasswordLabel.text = [dict objectForKey:@"uPassword"];
    cell.uPasswordLabel.textColor = [UIColor whiteColor];//Цвет текста

    cell.uEmailLabel.text = [dict objectForKey:@"uEmail"];
    cell.uEmailLabel.textColor = [UIColor whiteColor];//Цвет текста

    cell.uImage.image = [UIImage imageNamed:[dict objectForKey:@"uAvatar"]];

    return cell;

  } else {

    CustomTableViewCell *cell = (CustomTableViewCell *)
        [tableView dequeueReusableCellWithIdentifier:identifierItems
                                        forIndexPath:indexPath];

    cell.textLabel.text = [dict objectForKey:@"items"];
    cell.textLabel.textColor = [UIColor whiteColor];//Цвет текста
      
    cell.detailTextLabel.text = [dict objectForKey:@"price"];
    cell.detailTextLabel.textColor = [UIColor whiteColor];//Цвет текста
    return cell;
  }
}

#pragma mark - UITableViewDelegate

//Гасим выделение ячейки

- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

  [tableView deselectRowAtIndexPath:indexPath animated:1];
}

@end

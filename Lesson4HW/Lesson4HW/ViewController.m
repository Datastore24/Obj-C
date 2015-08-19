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

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *makeOrder;

@property (weak, nonatomic) IBOutlet UIButton *enter;

@property(strong, nonatomic) IBOutlet Shop *shop;
@property(strong, nonatomic) IBOutlet Users *users;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Shop * shop = [Shop new];
    self.shop = shop; //Область видимости объекта SHOP
    
    Users * users = [Users new];
    self.users = users; // Область видимости объекта Users
    
    NSLog(@"Добро пожаловать в %@! Наш телефон:%@",shop.sName,shop.sPhone);

    [self.makeOrder setEnabled:NO];
    [self.users setUsers:@"oxyfire" uPassword:@"123" uName:@"Ковыршин Кирилл" uAge:28 uSize:46L uEmail:@"co@datastore24.ru"];
    
    
}
- (IBAction)Enter:(id)sender {
  
    NSLog(@"Вы вошли как: %@ [%@]! \n\n Пароль: %@ \n Вам: %li лет \n Ваш размер: %li \n E-mail:%@",
          self.users.uName,self.users.uLogin,self.users.uPassword,self.users.uAge,self.users.uSize,self.users.uEmail);
    [self.makeOrder setEnabled:YES];
    [self.enter setEnabled:NO];
}


- (IBAction)makeOrder:(id)sender {
    NSArray * shopItems = [[NSArray alloc] initWithArray:[self.shop shopItems]];
    NSDictionary * itemsPrice = [[NSDictionary alloc] initWithDictionary:[self.shop itemsPrice]];
    for (int i=0; shopItems.count>i; i++) {
    
        NSString * itemKey = [NSString stringWithFormat:@"%@",[shopItems objectAtIndex:i]];
        NSString * items = [NSString stringWithFormat:@"%@ %@ руб.",[shopItems objectAtIndex:i],[itemsPrice objectForKey:itemKey]];
        NSLog(@"%@",items);
       // NSLog(@"%@ - %@ руб",[shopItems objectAtIndex:i]]);
    }
   
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

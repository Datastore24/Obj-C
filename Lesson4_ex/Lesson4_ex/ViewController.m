//
//  ViewController.m
//  Lesson4_ex
//
//  Created by Кирилл Ковыршин on 17.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "ViewController.h"
#import "Auto.h"

@interface ViewController ()

@property(weak, nonatomic) IBOutlet UIButton *button;
@property(strong, nonatomic) IBOutlet Auto *aut;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  //    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
  //    button.frame = CGRectMake(100, 100, 200, 40);
  //    button.backgroundColor = [UIColor redColor];
  //    [button setTitle:@"Кнопка кодом" forState:UIControlStateNormal];
  //    [self.view addSubview:button];

  //  [self.button addTarget:self
  //                  action:@selector(someAction)
  //        forControlEvents:UIControlEventTouchUpInside];
  //
  //  self.aut = [[Auto alloc] initWithModelName:@"VAZ"];
  //  // self.aut.model = @"VAZ";
  //
  //  self.string = @"string";

  //    NSString * string = @"String"; //Строка
  //    NSString * string2 = [string stringByAppendingString:@" and More text"];
  //    //Добавляет текст к строке
  //    NSString * stringNumber = @"1234567890";
  //    NSString * stringNumberEqual = @"123456789";
  //
  //    if ([stringNumber isEqualToString:stringNumberEqual]) {
  //        NSLog(@"YES");
  //    }else{
  //        NSLog(@"NO");
  //    }
  //
  //
  //    NSRange range =NSMakeRange(3, 4); // Диапазон
  //
  //    NSString * stringTrim = [stringNumber substringWithRange:range];
  //
  //    NSInteger length =  [stringNumber length];
  //
  //
  //    NSLog(@"%@",string);
  //    NSLog(@"%@",string2);
  //    NSLog(@"%@",stringTrim);
  //    NSLog(@"%li",length);
  //
  //    NSMutableString * stringMutable = [NSMutableString
  //    stringWithString:@"Numbers "];//изменяемая строка
  //    [stringMutable appendString:stringNumber]; // добавление без создание
  //    нового объекта
  //    [stringMutable replaceCharactersInRange:NSMakeRange(6, 3)
  //    withString:@"RRR"]; //Замена строки
  //    NSLog(@"%@",stringMutable);

  NSArray *array =
      [[NSArray alloc] initWithObjects:@"string1", @"string2", @"string3", nil];

  NSLog(@"array %@", array);

  NSMutableArray *mArray = [[NSMutableArray alloc] initWithArray:array];
    
    NSDictionary * dArray = [[NSDictionary alloc] initWithObjectsAndKeys:
                            array,@"Key",
                            @"string1",@"str",
                            nil]; //Вложенный массив
    NSLog(@"%@",[dArray valueForKey:@"str"]);
    
    [mArray addObject:@"string4"]; //Добавление одного объекта
    [mArray insertObject:@"SomeString" atIndex:mArray.count]; //Добавление элемента в конец

  NSLog(@"array %@", mArray);
    
    
    //Поиск в массиве
    
    if([mArray containsObject:@"string2"]){
        NSLog(@"String2 is find");
    }
    
 
    
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)someAction {
  NSLog(@"self.string %@", self.aut.model);
}
@end

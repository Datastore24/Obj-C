//
//  Shop.m
//  Lesson4HW
//
//  Created by Кирилл Ковыршин on 19.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "Shop.h"

@implementation Shop

- (instancetype)init
{
    self = [super init];
    if (self) {
        _sName = @"Магазин одежды и аксессуаров";
        _sPhone = @"+7 499 7135917";
    }
    return self;
}

-(NSArray *) shopItems {
    NSArray * itemsArray = [[NSArray alloc] initWithObjects:@"Джинсы",@"Куртка",@"Свитер",@"Майка",@"Футболка", nil];
    return itemsArray;
    
}

-(NSDictionary *) itemsPrice {
    NSDictionary * itemsPrice = @{@"Джинсы":@"100",
                                  @"Куртка":@"500",
                                  @"Свитер":@"250",
                                  @"Майка":@"900",
                                  @"Футболка":@"150"};
    return itemsPrice;
}

@end

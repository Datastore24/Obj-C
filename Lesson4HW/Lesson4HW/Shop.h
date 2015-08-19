//
//  Shop.h
//  Lesson4HW
//
//  Created by Кирилл Ковыршин on 19.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shop : NSObject

@property (strong, nonatomic, readonly) NSString * sName;
@property (strong, nonatomic, readonly) NSString * sPhone;

-(NSArray *) shopItems;
-(NSDictionary *) itemsPrice;


@end

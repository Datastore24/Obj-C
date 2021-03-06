//
//  ShopClass.h
//  Lesson5HW
//
//  Created by Кирилл Ковыршин on 23.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ShopClassDelegate; //Объявление протокола

@interface ShopClass : NSObject

@property (weak,nonatomic) id <ShopClassDelegate> delegate;
@property(strong, nonatomic) NSString *sName;
@property(strong, nonatomic) NSString *sPhone;

- (NSArray *)welcome ;
- (void) getShop;
- (void) getUsers;



@end

@protocol ShopClassDelegate <NSObject>

@required

- (void) showShopItems: (ShopClass *) shopclass array: (NSMutableArray *) array;
- (void) showUsers: (ShopClass *) shopcalss array: (NSMutableArray *) array;




@end

//
//  Auto.h
//  Lesson4_ex
//
//  Created by Кирилл Ковыршин on 17.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Auto : NSObject

@property (strong,nonatomic,readonly) NSString * model;
- (instancetype)initWithModelName : (NSString *) model;


@end

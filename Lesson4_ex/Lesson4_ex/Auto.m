//
//  Auto.m
//  Lesson4_ex
//
//  Created by Кирилл Ковыршин on 17.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "Auto.h"

@implementation Auto

- (instancetype)initWithModelName : (NSString *) model
{
    self = [super init];
    if (self) {
        _model = model;
    }
    return self;
}

- (void)dealloc
{

    NSLog(@"Dealloc!");
}

@end

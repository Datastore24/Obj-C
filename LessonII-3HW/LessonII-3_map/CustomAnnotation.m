//
//  CustomAnnotation.m
//  LessonII-3_map
//
//  Created by Кирилл Ковыршин on 21.09.15.
//  Copyright © 2015 datastore24. All rights reserved.
//

#import "CustomAnnotation.h"

@implementation CustomAnnotation

//Кастомная инициализация с координатами
- (instancetype)initWithLatitude: (double) latitude andLogitude: (double) longitude
{
    self = [super init];
    if (self) {
        
        _coordinate.latitude = latitude;
        _coordinate.longitude = longitude;
    }
    return self;
}
@end

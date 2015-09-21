//
//  CustomAnnotation.h
//  LessonII-3_map
//
//  Created by Кирилл Ковыршин on 21.09.15.
//  Copyright © 2015 datastore24. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CustomAnnotation : NSObject <MKAnnotation>

//Внутренняя переменная с координатами
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

//Инициализация объекта с координатами
- (instancetype)initWithLatitude: (double) latitude andLogitude: (double) longitude;
@end

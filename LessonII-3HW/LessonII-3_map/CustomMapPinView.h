//
//  CustomMapPinView.h
//  LessonII-3_map
//
//  Created by Кирилл Ковыршин on 21.09.15.
//  Copyright © 2015 datastore24. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface CustomMapPinView : MKAnnotationView

//инициализация для нестандартного изображения пина
- (instancetype)initWithImage;

@property (strong, nonatomic) UIImageView * imageView; 

@end

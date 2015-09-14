//
//  Animations.h
//  LessonII-1HW
//
//  Created by Кирилл Ковыршин on 14.09.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Animations : NSObject

+ (void) animationView: (UIView*) view withColor: (UIColor*) color; //Цвет view
+ (void) animationView: (UIView*) view withAlpha: (CGFloat) alpha; //Изменение прозрачности
+ (void) animateTextInLabel: (UILabel *) label withText: (NSString *) text; //Анимация текста
+ (void) animationFrameView: (UIView*) view withFrame: (CGRect) rect; //анимация фрейма
+ (void) animateTransformView: (UIView *) view withScale: (CGFloat) scale move_X: (CGFloat) moveX move_Y: (CGFloat) moveY alpha: (CGFloat) alpha delay: (CGFloat) delay; // Универсальный метод для анимации, смещения и измененрия размера

+ (void) animateImageView: (UIImageView *) imageView image: (UIImage *) image alpa: (CGFloat) alpha; //Анимация изображения

@end

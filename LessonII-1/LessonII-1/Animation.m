//
//  Animation.m
//  LessonII-1
//
//  Created by Кирилл Ковыршин on 11.09.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "Animation.h"


@implementation Animation

//Изменения цвета
+ (void) animationView: (UIView*) view withColor: (UIColor*) color{
//    [UIView animateWithDuration:0.3 animations:^{
//        
//        view.backgroundColor = color;
//    }];
    
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        view.backgroundColor = color;
    } completion:^(BOOL finished) {
       
    }];
}

//Анимация текста
+ (void) animateTextInLabel: (UILabel *) label withText: (NSString *) text{
    
    CATransition * transitionAnimation = [CATransition animation];
    transitionAnimation.type = kCATransitionPush;
    transitionAnimation.subtype = kCATransitionFromBottom;
    transitionAnimation.duration = 0.3;
    [transitionAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    [label.layer addAnimation:transitionAnimation forKey:nil];
    label.text = text;
    
}


//Анимация фрейма
+ (void) animationFrameView: (UIView*) view withFrame: (CGRect) rect{
    
    [UIView animateWithDuration:2.3 delay:0.0 usingSpringWithDamping:0.3 initialSpringVelocity:2.3 options:0 animations:^{
        view.frame = rect;
    } completion:^(BOOL finished) {
        
    }];
    
}


//Трансформация
+ (void) animateTransformView: (UIView *) view withScale: (CGFloat) scale move_X: (CGFloat) moveX move_Y: (CGFloat) moveY alpha: (CGFloat) alpha delay: (CGFloat) delay{
    
    [UIView animateWithDuration:2.3 delay:delay usingSpringWithDamping:0.3 initialSpringVelocity:2.3 options:0 animations:^{
        
        
        CGFloat transformX = 0;
        CGFloat transformY = 0;
        CGFloat transformScale = 0;
    
        transformX = moveX;
        transformY = moveY;
        transformScale = scale;
        
        CGAffineTransform scaleT = CGAffineTransformMakeScale(scale, scale);
        
        CGAffineTransform trans = CGAffineTransformMakeTranslation(transformX, transformY);
        
        CGAffineTransform resultTransform = CGAffineTransformConcat(trans, scaleT);
        
        view.transform = resultTransform;
        
        view.alpha = alpha;
        
        
    } completion:^(BOOL finished) {
        
    }];
}

//Появление изображения
+ (void) animateImageView: (UIImageView *) imageView image: (UIImage *) image alpa: (CGFloat) alpha {
    [UIView transitionWithView:imageView duration:2.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        imageView.image = image;
        imageView.alpha = alpha;
    } completion:NULL];
}




@end

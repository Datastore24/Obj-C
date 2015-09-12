//
//  Animation.m
//  LessonII-1
//
//  Created by Кирилл Ковыршин on 11.09.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "Animation.h"


@implementation Animation

+ (void) animationView: (UIView*) view withColor: (UIColor*) color{
    [UIView animateWithDuration:0.3 animations:^{
        
        view.backgroundColor = color;
    }];
}

+ (void) animateTextInLabel: (UILabel *) label withText: (NSString *) text{
    
    CATransition * transitionAnimation = [CATransition animation];
    transitionAnimation.type = kCATransitionPush;
    transitionAnimation.subtype = kCATransitionFromBottom;
    transitionAnimation.duration = 0.3;
    [transitionAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    [label.layer addAnimation:transitionAnimation forKey:nil];
    label.text = text;
    
}



@end

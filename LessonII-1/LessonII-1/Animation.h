//
//  Animation.h
//  LessonII-1
//
//  Created by Кирилл Ковыршин on 11.09.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Animation : NSObject

+ (void) animationView: (UIView*) view withColor: (UIColor*) color;
+ (void) animateTextInLabel: (UILabel *) label withText: (NSString *) text;

@end

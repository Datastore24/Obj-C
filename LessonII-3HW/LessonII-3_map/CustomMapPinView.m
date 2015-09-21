//
//  CustomMapPinView.m
//  LessonII-3_map
//
//  Created by Кирилл Ковыршин on 21.09.15.
//  Copyright © 2015 datastore24. All rights reserved.
//

#import "CustomMapPinView.h"

@implementation CustomMapPinView

//инициализация для нестандартного изображения пина
- (instancetype)initWithImage
{
    self = [super init];
    if (self) {
        //Костыль для тапа по пину
        self.image =[UIImage imageNamed:@"Clear.png"];
        //
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -10, 50, 43)];
        self.imageView.image =[UIImage imageNamed:@"bluepin.png"];
        [self addSubview:self.imageView ];
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(-50, self.imageView.frame.origin.y - 100, 200, 80)];
        view.layer.backgroundColor = [UIColor whiteColor].CGColor;
        view.layer.borderColor = [UIColor blackColor].CGColor;
        view.layer.borderWidth = 0;
        view.tag = 24;
        [view setBackgroundColor:[[UIColor clearColor] colorWithAlphaComponent:0]];
        
        [self addSubview:view];
        
        UIImageView * avatar = [[UIImageView alloc] initWithFrame:CGRectMake(view.frame.origin.x + 15, view.frame.origin.y + 15 , 50, 50    )];
        avatar.tag = 25;
        avatar.alpha = 0;
        avatar.image = [UIImage imageNamed:@"house.png"];
        
        [self addSubview:avatar];
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(view.frame.origin.x  + 65,view.frame.origin.y +15,100,40)];
        label.text = @"Адрес";
        label.textAlignment = NSTextAlignmentCenter;
        label.tag = 26;
        label.alpha = 0;
        
        [self addSubview:label];
        
        
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

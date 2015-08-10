//
//  HumanSkills.m
//  Human
//
//  Created by Кирилл Ковыршин on 07.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "HumanSkills.h"

@implementation HumanSkills

-(void) jump: (int) metr humanName: (NSString *) inputName
{
    if (metr>0 && metr<=3) {
        NSLog(@"%@ сказал: Я могу прыгнуть на %i метров",inputName, metr);
    }else if(metr>=5 && metr<=8){
        NSLog(@"%@ сказал: Я могу попробовать прыгнуть на %i метров, но я могу сломать ногу",inputName, metr);
    }else{
        NSLog(@"%@ сказал: Извините тренер, я так не умею.",inputName);
    }
   
}



@end

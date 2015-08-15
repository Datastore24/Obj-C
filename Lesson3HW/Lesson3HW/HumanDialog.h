//
//  HumanDialog.h
//  Lesson3HW
//
//  Created by Кирилл Ковыршин on 15.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface HumanDialog : NSObject

//Объявление методов

-(void) sayHello;

-(void) startDialog: (NSString *) name
                sex: (NSString*)sex
                age: (NSInteger) age
             height: (CGFloat) height
             weight: (CGFloat) weight
      maritalStatus: (NSInteger) maritalStatus
 programmingLaguage: (NSString *) programmingLaguage;

-(void) studyData;
-(void) separator;
-(void) studyDataFinish;
-(void) addToDatabase;


@end

//
//  Patient.h
//  Delegates
//
//  Created by Кирилл Ковыршин on 19.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@protocol PatientDelegate;

@interface Patient : NSObject

@property (strong,nonatomic) NSString * name;
@property (assign,nonatomic) CGFloat temperature;
@property (weak,nonatomic) id <PatientDelegate> delegate ;  //Всегда для делегатов

-(BOOL) howAreYou;
-(void) takePill;
-(void) makeShot;

@end

@protocol PatientDelegate
@required
- (void) patientFeelsBad:(Patient *) patient; //Метод содержит только ссылку на объект
- (void) patient:(Patient *) patient hasQuestion :(NSString*) question; //Метод и содержит ссылку на сам объект

@end

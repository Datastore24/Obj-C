//
//  Doctor.h
//  Delegates
//
//  Created by Кирилл Ковыршин on 19.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"

@protocol patientDelegate;

@interface Doctor : NSObject <PatientDelegate>

@end

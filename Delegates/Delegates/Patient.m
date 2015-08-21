//
//  Patient.m
//  Delegates
//
//  Created by Кирилл Ковыршин on 19.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "Patient.h"

@implementation Patient

-(BOOL) howAreYou{
    BOOL iFeelGood = arc4random() %2;
    if(!iFeelGood){
        [self.delegate patientFeelsBad:self];
    }
    return iFeelGood;
    
}

-(void) takePill{
    
    NSLog(@"%@ take a pill",self.name);
    
}

-(void) makeShot{
    
    NSLog(@"%@ make a shot",self.name); 
    
}


@end

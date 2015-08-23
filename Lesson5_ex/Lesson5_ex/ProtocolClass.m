//
//  ProtocolClass.m
//  Lesson5_ex
//
//  Created by Кирилл Ковыршин on 22.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "ProtocolClass.h"

@implementation ProtocolClass

//метод

-(void) methodWithString: (NSString *) string{
    
    NSMutableArray * arrayM =[[NSMutableArray alloc] init];
    NSArray * arrayNames = [[NSArray alloc] initWithObjects:@"Кирилл",@"Ольга",@"Даша", nil];
    NSArray * arrayDates = [[NSArray alloc] initWithObjects:@"1987",@"1988",@"2009", nil];
    
    for (int i=0; i < arrayDates.count; i++) {
        NSDictionary * dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                               [arrayDates objectAtIndex:i], @"date",
                               [arrayNames objectAtIndex:i], @"name", nil];
        [arrayM addObject:dict];
    }
    
   
    
    [self hideMethod:arrayM];
}

//Скртый метод делагата

-(void) hideMethod: (NSMutableArray *) array{
    
    if([self.delegate respondsToSelector:@selector(protocolMethod:array:)]){
       [self.delegate protocolMethod:self array:array];
    }
    
    
    
}

@end

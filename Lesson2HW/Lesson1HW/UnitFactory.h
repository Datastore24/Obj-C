//
//  UnitFactory.h
//  Lesson1HW
//
//  Created by Кирилл Ковыршин on 11.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "NotebookFactory.h"

@interface UnitFactory : NotebookFactory

-(void) operationSystem: (NSString *) os;
-(NSString *) installOS;
+ (void) unit;

@end

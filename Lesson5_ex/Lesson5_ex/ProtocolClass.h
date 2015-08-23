//
//  ProtocolClass.h
//  Lesson5_ex
//
//  Created by Кирилл Ковыршин on 22.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ProtocolClassDelegate; // Объявление протокола

@interface ProtocolClass : NSObject

@property (weak,nonatomic) id <ProtocolClassDelegate> delegate; // шаблонная запись

-(void)  methodWithString: (NSString *) string;

@end

@protocol ProtocolClassDelegate <NSObject> //Протокол и его методы

@required

- (void) protocolMethod: (ProtocolClass *) protocolClass array: (NSMutableArray *) array;




@end

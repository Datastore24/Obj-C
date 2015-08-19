//
//  Users.h
//  Lesson4HW
//
//  Created by Кирилл Ковыршин on 19.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Users : NSObject

@property (strong,nonatomic) NSString * uLogin;
@property (strong,nonatomic) NSString * uPassword;
@property (strong,nonatomic) NSString * uName;
@property (assign,nonatomic) NSInteger uAge;
@property (assign,nonatomic) NSInteger uSize;
@property (strong,nonatomic) NSString * uEmail;

-(void) setUsers:(NSString *) uLogin uPassword: (NSString *) uPassword
           uName: (NSString *) uName uAge: (NSInteger) uAge
           uSize: (NSInteger) uSize uEmail: (NSString *) uEmail;

@end

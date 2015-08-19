//
//  Users.m
//  Lesson4HW
//
//  Created by Кирилл Ковыршин on 19.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "Users.h"

@implementation Users

-(void) setUsers:(NSString *) uLogin uPassword: (NSString *) uPassword
           uName: (NSString *) uName uAge: (NSInteger) uAge
           uSize: (NSInteger) uSize uEmail: (NSString *) uEmail{
    self.uLogin = uLogin;
    self.uPassword = uPassword;
    self.uName = uName;
    self.uAge = uAge;
    self.uSize = uSize;
    self.uEmail = uEmail;
}



@end

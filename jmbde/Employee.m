// This program is free software: you can redistribute it and/or modify
// it under the terms of the European Union Public License (EUPL),
// version 1.1.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// European Union Public License for more details.
//
// You should have received a copy of the European Union Public Licence
// along with this program. If not, see
// http://www.osor.eu/eupl/european-union-public-licence-eupl-v.1.1
//
//
//  Employee.m
//  jmbde
//
//  Created by Jürgen Mülbert on 24.03.14.
//  Copyright (c) 2014 Jürgen Mülbert. All rights reserved.
//

#import "Employee.h"
#import "Computer.h"
#import "Phone.h"
#import "Printer.h"


@implementation Employee

@dynamic active;
@dynamic address;
@dynamic birthdate;
@dynamic creationTime;
@dynamic datacare;
@dynamic enddate;
@dynamic firstname;
@dynamic gender;
@dynamic homemail;
@dynamic homemobile;
@dynamic homephone;
@dynamic lastname;
@dynamic notes;
@dynamic photo;
@dynamic startdate;
@dynamic updateTime;
@dynamic accounts;
@dynamic computers;
@dynamic departments;
@dynamic documents;
@dynamic functions;
@dynamic phone;
@dynamic printer;
@dynamic titles;
@dynamic zipcodes;

- (void)awakeFromInsert {
    [super awakeFromInsert];
    
    self.firstname = NSLocalizedString(@"Firstname", @"The Firstname");
    self.lastname = NSLocalizedString(@"Lastname", @"The Lastname");
    
    NSDate *theDate = [NSDate date];
    
    [self setPrimitiveValue:theDate forKey:@"creationTime"];
    [self setPrimitiveValue:theDate forKey:@"updateTime"];
}

- (void)willSave {
    [super willSave];
    
    if (!self.isDeleted) {
        NSDate *theDate = [NSDate date];
        [self setPrimitiveValue:theDate forKey:@"updateTime"];
    }
}

@end

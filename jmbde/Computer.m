//
//  Computer.m
//  jmbde
//
//  Created by Jürgen Mülbert on 24.03.14.
//  Copyright (c) 2014 Jürgen Mülbert. All rights reserved.
//
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

#import "Computer.h"
#import "Employee.h"
#import "Printer.h"


@implementation Computer

@dynamic memory;
@dynamic network;
@dynamic network_ipaddress;
@dynamic network_name;
@dynamic service_number;
@dynamic service_tag;
@dynamic department;
@dynamic devicename;
@dynamic devicetype;
@dynamic employees;
@dynamic inventory;
@dynamic manufacturer;
@dynamic os;
@dynamic place;
@dynamic printer;
@dynamic processor;
@dynamic software;


- (void)awakeFromInsert {
    [super awakeFromInsert];
    
    self.name = NSLocalizedString(@"PC0001", @"The Computer Name");
}
@end

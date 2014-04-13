//
//  Printer.h
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

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Device.h"

/**
 Reference to the classes: Employee and Printer
 */
@class Computer, Employee;

/**
 The Class Printer
 @version 0.1
 @author Jürgen Mülbert
 @brief The connection between program
 and database for printer.
 @see Device
 @see Computer
 
 @page Printer
 This Class represent the Data in Program for Computer
 */
@interface Printer : Device

/**
 Is this a Color Printer: Boolean
 @todo Check the Database: is Boolean
 */
@property (nonatomic, retain) NSNumber * color;

/**
 The Network of the Computer
 @todo Add to the Device Class
 */
@property (nonatomic, retain) NSString * network;

/**
 The IPAddress of the Computer
 like: 192.168.1.2 or a IPV6 Address
 @todo Add to the Device Class
 */
@property (nonatomic, retain) NSString * network_ipaddress;

/**
 The Network Name of the Computer
 Should be the Computer Name
 @todo remove
 */
@property (nonatomic, retain) NSString * network_name;

/**
 The maximal Size of the usable Paper
 i.e. legal, A4
 */
@property (nonatomic, retain) NSString * papersize_max;

/**
 The type of Toner or Ink
 */
@property (nonatomic, retain) NSString * resources;

/**
 The Computer that direct connected to this Printer
 */
@property (nonatomic, retain) Computer *computers;

/**
 The Department in the Company (Place of the Printer)
 @see Department
 @todo Move the Property to Device
 */
@property (nonatomic, retain) NSManagedObject *department;

/**
 The Devicename of the Computer.
 i.e. Server, Desktop, Laptop
 @see devicename
 @todo Move the Property to Device
 */
@property (nonatomic, retain) NSManagedObject *devicename;

/**
 The Devicetype of the Computer
 i.e. Laptop, Moblie, Desktop
 @todo Check this
 @todo Move the Property to Device
 */
@property (nonatomic, retain) NSManagedObject *devicetype;

/**
 The Employee (User) of the Printer
 @see Employee
 @see NSSet
 @todo Move the Property to Device
 */
@property (nonatomic, retain) NSSet *employee;

/**
 If the Printer a Fax than is here the Data
 */
@property (nonatomic, retain) NSManagedObject *fax;

/**
 The Invetory Data
 @see Inventory
 @todo Move the Property to Device
 */
@property (nonatomic, retain) NSManagedObject *inventory;

/**
 The Manufacturer of the Computer
 @see Manufacturer
 @todo Move the Property to Device
 */
@property (nonatomic, retain) NSManagedObject *manufacturer;

/**
 The Place for the Computer
 @see Place
 @todo Move the Property to Device
 */
@property (nonatomic, retain) NSManagedObject *place;
@end

@interface Printer (CoreDataGeneratedAccessors)


/**
 Add an Employee to a Printer
 @param value - The Employee
 
 @todo Implement this: addEmployeesObject
 */
- (void)addEmployeeObject:(Employee *)value;

/**
 Remove an Employee from the Printer
 @param value - The Employee
 
 @todo Implement this: removeEmployeesObject
 */
- (void)removeEmployeeObject:(Employee *)value;

/**
 Add a Set of Employees for the Printer
 @param values - The Set ouf Employees
 
 @todo Implement this: addEmployees
 */
- (void)addEmployee:(NSSet *)values;

/**
 Remove a Set of Employees for the Computer
 @param values - The Set ouf Employees
 
 @todo Implement this: removeEmployees
 */
- (void)removeEmployee:(NSSet *)values;

@end

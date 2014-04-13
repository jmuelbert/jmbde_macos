//
//  Computer.h
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
@class Employee, Printer;


/**
 The Class Computer
 @version 0.1
 @author Jürgen Mülbert
 @brief The connection between program
 and database for comuter.
 @see Device
 @see Employee
 @see Printer
 @see Phone
 
 @page Computer
 This Class represent the Data in Program for Computer
 */
@interface Computer : Device

/**
 The Memomory that by the computer available
 */
@property (nonatomic, retain) NSNumber * memory;

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
 The Service Number for Support
 */
@property (nonatomic, retain) NSString * service_number;

/**
 The Service Tag for Support
 */
@property (nonatomic, retain) NSString * service_tag;

/**
 The Department in the Company (Place of the Computer)
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
 The Employee (User) of the Computer
 @see Employee
 @see NSSet
 @todo Move the Property to Device
 */
@property (nonatomic, retain) NSSet *employees;

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
 The OS (Operation System)
 @see OS
 */
@property (nonatomic, retain) NSManagedObject *os;

/**
 The Place for the Computer
 @see Place
 @todo Move the Property to Device
 */
@property (nonatomic, retain) NSManagedObject *place;

/**
 The Printer on the Computer
 This is a local Printer, not an Network Printer
 @see Printer
 */
@property (nonatomic, retain) Printer *printer;

/**
 The Processor of the Computer
 @see Processor
 */
@property (nonatomic, retain) NSManagedObject *processor;

/**
 The Software that is installed on the Computer
 @see Software
 */
@property (nonatomic, retain) NSSet *software;
@end

@interface Computer (CoreDataGeneratedAccessors)

/**
 Add an Employee to a Computer
 @param value - The Employee
 
 @todo Implement this: addEmployeesObject
 */
- (void)addEmployeesObject:(Employee *)value;

/**
 Remove an Employee from the Computer
 @param value - The Employee
 
 @todo Implement this: removeEmployeesObject
 */
- (void)removeEmployeesObject:(Employee *)value;

/**
 Add a Set of Employees for the Computer
 @param values - The Set ouf Employees
 
 @todo Implement this: addEmployees
 */
- (void)addEmployees:(NSSet *)values;


/**
 Remove a Set of Employees for the Computer
 @param values - The Set ouf Employees
 
 @todo Implement this: removeEmployees
 */
- (void)removeEmployees:(NSSet *)values;

/**
 Add Software to the Computer
 @param value - The NSManagedObject with the Software
 
 @todo Implement this: addSoftwareObject
 */
- (void)addSoftwareObject:(NSManagedObject *)value;

/**
 Remove Software to the Computer
 @param value - The NSManagedObject with the Software
 
 @todo Implement this: removeSoftwareObject
 */
- (void)removeSoftwareObject:(NSManagedObject *)value;

/**
 Add a Set of Software to the Computer
 @param values - The NSSet with the Software
 
 @todo Implement this: addSoftwareObject
 */
- (void)addSoftware:(NSSet *)values;

/**
 Remove a Set of Software to the Computer
 @param values - The NSSet with the Software
 
 @todo Implement this: removeSoftwareObject
 */
- (void)removeSoftware:(NSSet *)values;

@end

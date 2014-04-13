//
//  Phone.h
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
 Reference to the class: Employee
 */
@class Employee;


/**
The Class Phone
@version 0.1
@author Jürgen Mülbert
@brief The connection between program
and database for phone.
@see Device
@see Employee
@see Phone

@page Phone
This Class represent the Data in Program for Phone
*/

@interface Phone : Device

/**
 The Number of the Phone
 */
@property (nonatomic, retain) NSString * number;

/**
 The PIN of the Phone (For release..)
 */
@property (nonatomic, retain) NSString * pin;

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
 @todo Move the Property to Device
 */
@property (nonatomic, retain) Employee *employee;

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

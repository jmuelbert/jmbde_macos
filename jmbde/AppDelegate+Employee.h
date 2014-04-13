//
//  AppDelegate+Employee.h
//  jmbde
//
//  Created by Jürgen Mülbert on 16.03.14.
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
#import <Cocoa/Cocoa.h>


#import "AppDelegate.h"

/**
 The Class AppDelegate (EmployeeAppDelegate)
 @version 0.1
 @author Jürgen Mülbert
 @brief The most important class
 @see NSObject
 @see NSApplicationDelegate
 @see Appdelegate(EmployeeAppDelegate)
 */
@interface AppDelegate (EmployeeAppDelegate)


/**
 Property to Sort Employees
 @see NSSortDescriptor
 @see NSArray
 */
@property (nonatomic, readonly) NSArray *employeeSortDescriptors;


/**
 addComputer
 @brief Adds the relation between employee and computer
 @param sender - The sender of the Message
 @returns IBAction
 */
- (IBAction)addComputer:(id)sender;

/**
 addPrinter
 @brief Adds the relation between employee and printer
 @param sender - The sender of the Message
 @returns IBAction
 */
- (IBAction)addPrinter:(id)sender;

/**
 addPhone
 @brief Adds the relation between employee and phone
 @param sender - The sender of the Message
 @returns IBAction
 */
- (IBAction)addPhone:(id)sender;

/**
 printEmployee
 @brief Print the seleceted Employee with
  assiciated data
 @returns IBAction
 */
- (IBAction)printEmployee:(id)sender;
@end

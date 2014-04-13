//
//  AppDelegate.h
//  jmbde
//
//  Created by Jürgen Mülbert on 20.02.14.
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

/**
 @mainpage jmbde
 @section sec1 Introduction
This Program can used to add an Employee, an Computer, an Printer and a Phone. Also you con create relations betweem Employee an the others.
 
 @section sec2 Employee
 @section sec3 Computer
 @section sec4 Printer
 @section sec5 Phone
 @section sec6 Help
 */


#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

/**
 The Class AppDelegate
 @version 0.1
 @author Jürgen Mülbert
 @brief The most important class
 @see NSObject
 @see NSApplicationDelegate
 */
@interface AppDelegate : NSObject <NSApplicationDelegate, NSAlertDelegate> 

/**
 The Outlet for the Main Window
 @see NSWindow
 */
@property (assign) IBOutlet NSWindow *window;

/**
 The Property for the PersistantStroreCoordinator
 @see NSPersistentStoreCoordinator
 */
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

/**
 The Property for the ManagedObjectModel
 @see NSManagedObjectModel
 */
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;

/**
 The Property for the ManagedObjectContext
 @see NSManagedObjectContext
 */
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

/**
The Property to the Employee Array Controller
This is used to reflect the Database Entries
to the Table for Display
 @see  NSArrayController
*/
@property (readwrite, strong, nonatomic) IBOutlet NSArrayController *employeeController;

/**
 The Property to the Employee-Computer Arrary Controller
 This Reflect the relation between the Employee and PC (and revers)
 @see NSArrayController
 */
@property (readwrite, strong, nonatomic)IBOutlet NSArrayController *employeeComputerController;

/**
 The Property for the Computer Array Controller
 This is used to Handle the Computer Data 
  @see NSArrayController
 */
@property (readwrite, strong, nonatomic) IBOutlet NSArrayController *computerController;

/**
 The Property to the Employee Printer Controller
 This is used to Handle the Printers used by the Emoloyee's
  @see NSArrayController
 */
@property (readwrite, strong, nonatomic) IBOutlet NSArrayController *employeePrinterController;

/**
 The Property to handle the Employee Phone Controller
 This is used to Handle the Phones used by Employee
  @see NSArrayController
 */
@property (readwrite, strong, nonatomic) IBOutlet NSArrayController *employeePhoneController;

/**
 The Property to the Computer Array Controller
 This is used the reflect the Database Entries
  @see NSArrayController @see NSArrayController
 */
@property (readwrite, strong, nonatomic) IBOutlet NSArrayController *printerController;

/**
  The Property for the Phone Array Controller.
  This is used to Handle the Phones
  @see NSArrayController 
*/
@property (readwrite, strong, nonatomic) IBOutlet NSArrayController *phoneController;

@end

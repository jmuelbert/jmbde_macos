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
 */

#import <Cocoa/Cocoa.h>

/**
 The Class AppDelegate
 @version 0.0.1
 @author Jürgen Mülbert
 @brief The most important class
 @see NSObject
 @see NSApplicationDelegate
 */
@interface AppDelegate : NSObject <NSApplicationDelegate, NSAlertDelegate> {
  
}

/**
 The Outlet for the Main Window
 */
@property (assign) IBOutlet NSWindow *window;

/**
 The Property for the PersistantStroreCoordinator
 */
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

/**
 The Property for the ManagedObjectModel
 */
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;

/**
 The Property for the ManagedObjectContext
 */
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

/**
 The Property to the Employee Array Controller
 This is used to reflect the Database Entries   
 to the Table for Display
 */
@property (readwrite, strong, nonatomic) IBOutlet NSArrayController *employeeController;

/**
 The Property to the Employee-Computer Arrary Controller
 This Reflect the relation between the Employee and PC (and revers)
 */
@property (readwrite, strong, nonatomic)IBOutlet NSArrayController *employeeComputerController;

/**
 The Property to the Computer Array Controller
 This is used the reflect the Database Entries
 */
@property (readwrite, strong, nonatomic) IBOutlet NSArrayController *computerController;

/**
 AddComputerToEmployee
 @brief Adds the relation between employee and computer
 @param sender - The sender of the Message  
 @returns IBAction
 */
- (IBAction)addComputerToEmployee:(id)sender;

@end

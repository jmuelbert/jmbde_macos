//
//  MySpotlightImporter.h
//  jmbdeImporter
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

#import <Cocoa/Cocoa.h>


/**
 The Class MySpotlightImporter
 @version 0.0.1
 @author Jürgen Mülbert
 @brief Provide the Spotlight Import
 @see NSObject
 */
@interface MySpotlightImporter : NSObject

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
 importFileAtPath
 @brief
 @param filePath - the File Path
 @param attributes - the Directory
 @param error - the error
 */
- (BOOL)importFileAtPath:(NSString *)filePath attributes:(NSMutableDictionary *)attributes error:(NSError **)error;

@end

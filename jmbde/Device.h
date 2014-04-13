//
//  Device.h
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


/**
 The Class Device
 @version 0.1
 @author Jürgen Mülbert
 @brief This is the root for all Devices
 @see Computer
 @see Printer
 @see Phone
 
 @page Device
 
 */
@interface Device : NSManagedObject

/**
 Is the Device activ: Boolean
 @todo Check is in Database boolean
 */
@property (nonatomic, retain) NSNumber * active;

/**
 The Date/Time where the Data created
 */
@property (nonatomic, retain) NSDate * creationTime;

/**
 The Name of the Device for Display
 */
@property (nonatomic, retain) NSString * name;

/**
 Should the Device replace: Boolean
 @todo Check is in Database boolean
 */
@property (nonatomic, retain) NSNumber * replace;

/**
 The Serialnumber of the Device
 */
@property (nonatomic, retain) NSString * serialnumber;

/**
 The last modification of the Dataset (Date/Time)
 */
@property (nonatomic, retain) NSDate * updateTime;

@end

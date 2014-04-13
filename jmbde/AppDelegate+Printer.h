//
//  AppDelegate+Printer.h
//  jmbde
//
//  Created by Jürgen Mülbert on 30.03.14.
//  Copyright (c) 2014 Jürgen Mülbert. All rights reserved.
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
 The Class AppDelegate (PrinterAppDelegate)
 @version 0.1
 @author Jürgen Mülbert
 @brief The most important class
 @see NSObject
 @see NSApplicationDelegate
 @see Appdelegate(PrinterAppDelegate)
 */
@interface AppDelegate (PrinterAppDelegate)


/**
 Property to Sort Printers
 @see NSSortDescriptor
 @see NSArray
 */
@property (nonatomic, readonly) NSArray *printerSortDescriptors;

@end

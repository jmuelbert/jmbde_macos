//
//  AppDelegate+Employee.m
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

#import <WebKit/WebKit.h>

#import "AppDelegate+Employee.h"

#import "Employee.h"
#import "Computer.h"
#import "Printer.h"
#import "Phone.h"


/**
 Privte Interface for Appdelegate
 */
@interface AppDelegate (EmployeeAppDelegatePrivate)
/**
 Print Employee (Firstname and Lastname) and assicioted Devices
 @param Employee - Pointer to the Employee-Class
 @return Nsstring - the generatad HTML-Page.
 */
- (NSString *)employeeAsPrintHtml:(Employee *)employee;
@end



@implementation AppDelegate (EmployeeAppDelegate)

- (IBAction)addComputer:(id)sender {
    id selectedComputer = [self.computerController selection];
    id selectedEmployee = [self.employeeController selection];
    
    NSAssert(selectedComputer != nil && selectedEmployee != nil, @"Employee and Computer must be selected");
    
    NSManagedObject *newComputerToAdd = [self.managedObjectContext objectWithID:[selectedComputer valueForKey:@"objectID"]];
    
    NSLog(@"%@ ComputerToAdd", newComputerToAdd.debugDescription);
    
    [self.employeeComputerController addObject:newComputerToAdd];
}

- (IBAction)addPrinter:(id)sender {
    id selectedPrinter = [self.printerController selection];
    id selectedEmployee = [self.employeeController selection];
    
    NSAssert(selectedPrinter != nil && selectedEmployee != nil, @"Employee and Printer must be selected");
    
    NSManagedObject *newPrinterToAdd = [self.managedObjectContext objectWithID:[selectedPrinter valueForKey:@"objectID"]];
    
    NSLog(@"%@ PrinterToAdd", newPrinterToAdd.debugDescription);
    
    [self.employeePrinterController addObject:newPrinterToAdd];

}

- (IBAction)addPhone:(id)sender {
    id selectedPhone = [self.phoneController selection];
    id selectedEmployee = [self.employeeController selection];
    
    NSAssert(selectedPhone != nil && selectedEmployee != nil, @"Employee and Phone must be selected");
    
    NSManagedObject *newPhoneToAdd = [self.managedObjectContext objectWithID:[selectedPhone valueForKey:@"objectID"]];
    
    NSLog(@"%@ PhoneToAdd", newPhoneToAdd.debugDescription);
    
    [self.employeePhoneController addObject:newPhoneToAdd];

}

- (IBAction)printEmployee:(id)sender {
    [self.managedObjectContext commitEditing];
    
    id employeeList = [self.employeeController arrangedObjects];
    
    NSMutableString *employeeText = [NSMutableString new];
    for (id element in employeeList)
    {
        Employee *employee = (Employee *) [self.managedObjectContext objectWithID:[element valueForKey:@"objectID"]];
        [employeeText appendString:[self employeeAsPrintHtml:employee]];
    }
         
    NSString *htmlString =
        [NSString stringWithFormat:@"<html> "
            "<head>"
            "<style type='text/css'>"
            "body {margin: 0px; } "
            "div { font-family: sans-serif; "
                "font-size: 12pt; } "
            ".employee { margin-bottom: 24pt; } "
            ".label { font-weight: bold } "
            ".employeename {font-size: 18pt; } "
            ".name { font-size: 16pt; } "
            "</style>"
            "</head><body><p>%@</p></body></html>",
         employeeText];
    
    NSLog(@"HTML Text: %@", htmlString);
    
    WebView *myView = [WebView new];
    [myView setFrameLoadDelegate:self];
    [[myView mainFrame] loadHTMLString:htmlString baseURL:nil];
}


- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame
{
    NSPrintInfo *info = [NSPrintInfo sharedPrintInfo];
    
    [info setLeftMargin:28];
    [info setRightMargin:28];
    [info setTopMargin:43];
    [info setBottomMargin:43];
    [info setVerticallyCentered:NO];
    
    NSPrintOperation *printOp = [NSPrintOperation printOperationWithView:[[[sender mainFrame] frameView] documentView] printInfo:info];
    
    [printOp runOperation];
}


- (NSString *)employeeAsPrintHtml:(Employee *)employee
{
    NSMutableString *employeeText = [NSMutableString new];
    
    
    [employeeText appendString:@"<div class='employee'>"];
    [employeeText appendFormat:@"<div class='employeename'>"
     "<span class='label'>Name:</span> %@ %@</div>", employee.firstname, employee.lastname];

    [employeeText appendFormat:@"<div class='computer'>"
     "<span class='name'>Computername:</span> %@</div>", employee.computers.name];

    if ([employee.printer.name isNotEqualTo:@"" ])
    {
        [employeeText appendFormat:@"<div class='printer'>"
        "<span class='name'>Printername:</span> %@</div>", employee.printer.name];
    }
    
    [employeeText appendFormat:@"<div class='phone'>"
     "<span class='name'>Phone Number:</span> %@</div>", employee.phone.number];
    
    NSLog(@"Print Text: %@", employeeText);
    
    return employeeText;
}

- (NSArray *)employeeSortDescriptors
{
    return [NSArray arrayWithObject:
            [[NSSortDescriptor alloc] initWithKey:@"lastname" ascending:YES]];
}


@end

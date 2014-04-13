//
//  Employee.h
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
 Reference to the classes: Computer, Phone and Printer
 */
@class Computer, Phone, Printer;

/**
 The Class Employee
 @version 0.1
 @author Jürgen Mülbert
 @brief The connection between program
 and database for employee.

 @see Computer
 @see Phone
 @see Printer
 @see NSManagedObject
 
 @page Employee
 This Class represent the Data in Program for Computer
 */
@interface Employee : NSManagedObject


/**
 Is the Employee activ: Boolean
 @todo Check is in Database boolean
 */
@property (nonatomic, retain) NSNumber * active;

/**
 The address of the Employee
 */
@property (nonatomic, retain) NSString * address;

/**
 The Day of birth 
 */
@property (nonatomic, retain) NSDate * birthdate;

/**
 The Date/Time where the Data created
 */
@property (nonatomic, retain) NSDate * creationTime;

/**
 Is the Employee briefed for datacare: Boolean
 @todo Check is in Database boolean
 */
@property (nonatomic, retain) NSNumber * datacare;

/**
 The Date when the Employee leave the Company
 */
@property (nonatomic, retain) NSDate * enddate;

/**
 The Fristname of the Employee
 */
@property (nonatomic, retain) NSString * firstname;

/**
 The Gender of the Employee
 */
@property (nonatomic, retain) NSString * gender;

/**
 The private (Home) Mailaddress
 */
@property (nonatomic, retain) NSString * homemail;

/**
 The private Mobile Number
 */
@property (nonatomic, retain) NSString * homemobile;

/**
 The private Phonenumber
 */
@property (nonatomic, retain) NSString * homephone;

/**
 The Lastname
 */
@property (nonatomic, retain) NSString * lastname;

/**
 Notes :-)
 */
@property (nonatomic, retain) NSString * notes;

/**
 A Photo from the Employee
 */
@property (nonatomic, retain) id photo;

/**
 The Startdate. The Employee begins on this date
 */
@property (nonatomic, retain) NSDate * startdate;

/**
 The last modification of the Dataset (Date/Time)
 */
@property (nonatomic, retain) NSDate * updateTime;

/**
 The accounts.
 i.e. Lan-Account, E-Mail, Foreign-Systems and more
 */
@property (nonatomic, retain) NSSet *accounts;

/**
 The Computer that the Employee use
 */
@property (nonatomic, retain) Computer *computers;

/**
 The Department in the Company (Place of the Printer)
 @see Department
 */
@property (nonatomic, retain) NSManagedObject *departments;

/**
 The Documents for the Employee
 i.e. Useraccounts...
 */
@property (nonatomic, retain) NSSet *documents;

/**
 What the should do
 */
@property (nonatomic, retain) NSManagedObject *functions;

/**
 The Phone of the Employee
 */
@property (nonatomic, retain) Phone *phone;

/**
 The Printer of the Employee
 */
@property (nonatomic, retain) Printer *printer;

/**
 The Titles of the Employee
 */
@property (nonatomic, retain) NSManagedObject *titles;

/**
 The Zipcode
 */
@property (nonatomic, retain) NSManagedObject *zipcodes;
@end

@interface Employee (CoreDataGeneratedAccessors)

/**
 Add an Account to the Employee
 @param value - The Account
 
 @todo Implement this: addAccountsObject
 */
- (void)addAccountsObject:(NSManagedObject *)value;

/**
 Remove the Account from Employee
 @param value - The Account
 
 @todo Implement this: removeAccountsObject
 */
- (void)removeAccountsObject:(NSManagedObject *)value;

/**
 Add a Set of Accounts to the Employee
 @param values - The Accounts
 @see NSSet
 
 @todo Implement this: addAccounts
 */
- (void)addAccounts:(NSSet *)values;

/**
 Remove a Set of Accounts from Employee
 @param values - The Accounts
 @see NSSet
 
 @todo Implement this: removeAccounts
 */
- (void)removeAccounts:(NSSet *)values;

/**
 Add a Document to the Employee
 @param value - The Document
 
 @todo Implement this: addDocumentsObject
 */
- (void)addDocumentsObject:(NSManagedObject *)value;

/**
 Remove the Document from the Employee
 @param value - The Document
 
 @todo Implement this: removeDocumentsObject
 */
- (void)removeDocumentsObject:(NSManagedObject *)value;

/**
 Add a Set of Document to the Employee
 @param values - The Documents
 
 @todo Implement this: addDocuments
 */
- (void)addDocuments:(NSSet *)values;

/**
 Remove a Set of Documents from the Employee
 @param values - The Documents
 
 @todo Implement this: removeDocuments
 */
- (void)removeDocuments:(NSSet *)values;

@end

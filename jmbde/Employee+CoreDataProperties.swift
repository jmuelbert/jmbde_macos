//
//  Employee+CoreDataProperties.swift
//  jmbde
//
//  Created by Jürgen Mülbert on 06.07.17.
//  Copyright © 2017 Jürgen Mülbert. All rights reserved.
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var active: Bool
    @NSManaged public var businessEMail: String?
    @NSManaged public var created: NSDate?
    @NSManaged public var datacare: Bool
    @NSManaged public var employeeID: String?
    @NSManaged public var endDate: String?
    @NSManaged public var notes: String?
    @NSManaged public var photo: NSData?
    @NSManaged public var startDate: NSDate?
    @NSManaged public var timeStamp: NSDate?
    @NSManaged public var rel_Account: Account?
    @NSManaged public var rel_Chipcard: Chipcard?
    @NSManaged public var rel_Company: Company?
    @NSManaged public var rel_Department: Departmant?
    @NSManaged public var rel_Device: Device?
    @NSManaged public var rel_Document: Document?
    @NSManaged public var rel_Fax: Fax?
    @NSManaged public var rel_Mobile: Mobile?
    @NSManaged public var rel_Phone: Phone?
    @NSManaged public var rel_Place: Place?
    @NSManaged public var rel_Printer: Printer?
    @NSManaged public var rel_Function: Function?

}

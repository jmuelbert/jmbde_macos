//
//  Company+CoreDataProperties.swift
//  jmbde
//
//  Created by Jürgen Mülbert on 06.07.17.
//  Copyright © 2017 Jürgen Mülbert. All rights reserved.
//

import Foundation
import CoreData


extension Company {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Company> {
        return NSFetchRequest<Company>(entityName: "Company")
    }

    @NSManaged public var businessMail: String?
    @NSManaged public var cphone: String?
    @NSManaged public var created: NSDate?
    @NSManaged public var fax: String?
    @NSManaged public var name: String?
    @NSManaged public var name2: String?
    @NSManaged public var timeStamp: NSDate?
    @NSManaged public var rel_Employee: Employee?
    @NSManaged public var rel_Fax: Fax?
    @NSManaged public var rel_Phone: Phone?
    @NSManaged public var rel_Printer: Printer?

}

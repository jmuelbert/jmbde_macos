//
//  Departmant+CoreDataProperties.swift
//  
//
//  Created by Jürgen Mülbert on 29.07.17.
//
//

import Foundation
import CoreData


extension Departmant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Departmant> {
        return NSFetchRequest<Departmant>(entityName: "Departmant")
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var name: String?
    @NSManaged public var prio: Int16
    @NSManaged public var timeStamp: NSDate?
    @NSManaged public var rel_Device: Device?
    @NSManaged public var rel_Employee: Employee?
    @NSManaged public var rel_Fax: Fax?
    @NSManaged public var rel_Phone: Phone?
    @NSManaged public var rel_Printer: Printer?

}

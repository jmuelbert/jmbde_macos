//
//  Function+CoreDataProperties.swift
//  
//
//  Created by Jürgen Mülbert on 29.07.17.
//
//

import Foundation
import CoreData


extension Function {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Function> {
        return NSFetchRequest<Function>(entityName: "Function")
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var name: String?
    @NSManaged public var prio: Int16
    @NSManaged public var timeStamp: NSDate?
    @NSManaged public var rel_Employee: Employee?

}

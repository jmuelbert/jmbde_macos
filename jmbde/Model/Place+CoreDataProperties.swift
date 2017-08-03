//
//  Place+CoreDataProperties.swift
//  
//
//  Created by Jürgen Mülbert on 29.07.17.
//
//

import Foundation
import CoreData


extension Place {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Place> {
        return NSFetchRequest<Place>(entityName: "Place")
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var desk: String?
    @NSManaged public var name: String?
    @NSManaged public var room: String?
    @NSManaged public var timeStamp: NSDate?
    @NSManaged public var rel_Company: Company?
    @NSManaged public var rel_Device: Device?
    @NSManaged public var rel_Employee: Employee?
    @NSManaged public var rel_Inventory: Inventory?

}

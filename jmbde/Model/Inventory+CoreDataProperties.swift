//
//  Inventory+CoreDataProperties.swift
//  
//
//  Created by Jürgen Mülbert on 29.07.17.
//
//

import Foundation
import CoreData


extension Inventory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Inventory> {
        return NSFetchRequest<Inventory>(entityName: "Inventory")
    }

    @NSManaged public var active: Bool
    @NSManaged public var created: NSDate?
    @NSManaged public var inventoryID: String?
    @NSManaged public var text: String?
    @NSManaged public var timeStamp: NSDate?
    @NSManaged public var rel_Place: Place?
    @NSManaged public var rel_Device: Device?

}

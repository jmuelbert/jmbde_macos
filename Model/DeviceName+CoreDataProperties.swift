//
//  DeviceName+CoreDataProperties.swift
//  
//
//  Created by Jürgen Mülbert on 29.07.17.
//
//

import Foundation
import CoreData


extension DeviceName {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DeviceName> {
        return NSFetchRequest<DeviceName>(entityName: "DeviceName")
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var name: String?
    @NSManaged public var timeStamp: NSDate?
    @NSManaged public var rel_Device: Device?

}

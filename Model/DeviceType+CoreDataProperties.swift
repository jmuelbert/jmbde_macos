//
//  DeviceType+CoreDataProperties.swift
//  
//
//  Created by Jürgen Mülbert on 29.07.17.
//
//

import Foundation
import CoreData


extension DeviceType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DeviceType> {
        return NSFetchRequest<DeviceType>(entityName: "DeviceType")
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var name: String?
    @NSManaged public var timeStamp: NSDate?
    @NSManaged public var rel_Device: Device?

}

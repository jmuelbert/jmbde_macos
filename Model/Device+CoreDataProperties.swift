//
//  Device+CoreDataProperties.swift
//  
//
//  Created by Jürgen Mülbert on 29.07.17.
//
//

import Foundation
import CoreData


extension Device {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Device> {
        return NSFetchRequest<Device>(entityName: "Device")
    }

    @NSManaged public var active: Bool
    @NSManaged public var created: NSDate?
    @NSManaged public var network: String?
    @NSManaged public var netWorkName: String?
    @NSManaged public var replace: Bool
    @NSManaged public var serialNumber: String?
    @NSManaged public var serviceNumber: String?
    @NSManaged public var serviceTag: String?
    @NSManaged public var timeStamp: NSDate?
    @NSManaged public var rel_Company: Company?
    @NSManaged public var rel_DeviceName: DeviceName?
    @NSManaged public var rel_DeviceType: DeviceType?
    @NSManaged public var rel_Employee: Employee?
    @NSManaged public var rel_Inventory: Inventory?
    @NSManaged public var rel_Place: Place?
    @NSManaged public var rel_Department: Departmant?

}

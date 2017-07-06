//
//  DeviceType+CoreDataProperties.swift
//  jmbde
//
//  Created by Jürgen Mülbert on 06.07.17.
//  Copyright © 2017 Jürgen Mülbert. All rights reserved.
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

}

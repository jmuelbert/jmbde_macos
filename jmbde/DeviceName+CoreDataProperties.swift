//
//  DeviceName+CoreDataProperties.swift
//  jmbde
//
//  Created by Jürgen Mülbert on 06.07.17.
//  Copyright © 2017 Jürgen Mülbert. All rights reserved.
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

}

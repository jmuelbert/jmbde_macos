//
//  ChipcardDoor+CoreDataProperties.swift
//  jmbde
//
//  Created by Jürgen Mülbert on 06.07.17.
//  Copyright © 2017 Jürgen Mülbert. All rights reserved.
//

import Foundation
import CoreData


extension ChipcardDoor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ChipcardDoor> {
        return NSFetchRequest<ChipcardDoor>(entityName: "ChipcardDoor")
    }

    @NSManaged public var active: Bool
    @NSManaged public var created: NSDate?
    @NSManaged public var name: String?
    @NSManaged public var timeStamp: NSDate?
    @NSManaged public var rel_Company: Company?

}

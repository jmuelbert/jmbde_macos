//
//  Chipcard+CoreDataProperties.swift
//  jmbde
//
//  Created by Jürgen Mülbert on 06.07.17.
//  Copyright © 2017 Jürgen Mülbert. All rights reserved.
//

import Foundation
import CoreData


extension Chipcard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Chipcard> {
        return NSFetchRequest<Chipcard>(entityName: "Chipcard")
    }

    @NSManaged public var active: Bool
    @NSManaged public var created: NSDate?
    @NSManaged public var name: String?
    @NSManaged public var timeStamp: NSDate?
    @NSManaged public var rel_ChipcardDoor: ChipcardDoor?
    @NSManaged public var rel_ChipcardProfile: ChipcardProfile?
    @NSManaged public var rel_Employee: Employee?

}

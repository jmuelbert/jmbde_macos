//
//  ChipcardDoor+CoreDataProperties.swift
//  
//
//  Created by Jürgen Mülbert on 29.07.17.
//
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
    @NSManaged public var rel_Chipcard: Chipcard?
    @NSManaged public var rel_ChipCardProfile: ChipcardProfile?

}

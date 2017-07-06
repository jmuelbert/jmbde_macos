//
//  Place+CoreDataProperties.swift
//  jmbde
//
//  Created by Jürgen Mülbert on 06.07.17.
//  Copyright © 2017 Jürgen Mülbert. All rights reserved.
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

}

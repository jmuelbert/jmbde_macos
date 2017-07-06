//
//  Processor+CoreDataProperties.swift
//  jmbde
//
//  Created by Jürgen Mülbert on 06.07.17.
//  Copyright © 2017 Jürgen Mülbert. All rights reserved.
//

import Foundation
import CoreData


extension Processor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Processor> {
        return NSFetchRequest<Processor>(entityName: "Processor")
    }

    @NSManaged public var cores: Int16
    @NSManaged public var created: NSDate?
    @NSManaged public var ghz: Float
    @NSManaged public var name: String?
    @NSManaged public var timeStamp: NSDate?

}

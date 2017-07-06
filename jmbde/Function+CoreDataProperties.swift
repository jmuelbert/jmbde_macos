//
//  Function+CoreDataProperties.swift
//  jmbde
//
//  Created by Jürgen Mülbert on 06.07.17.
//  Copyright © 2017 Jürgen Mülbert. All rights reserved.
//

import Foundation
import CoreData


extension Function {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Function> {
        return NSFetchRequest<Function>(entityName: "Function")
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var name: String?
    @NSManaged public var prio: Int16
    @NSManaged public var timeStamp: NSDate?

}

//
//  Printer+CoreDataProperties.swift
//  jmbde
//
//  Created by Jürgen Mülbert on 06.07.17.
//  Copyright © 2017 Jürgen Mülbert. All rights reserved.
//

import Foundation
import CoreData


extension Printer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Printer> {
        return NSFetchRequest<Printer>(entityName: "Printer")
    }

    @NSManaged public var color: Bool
    @NSManaged public var copier: Bool
    @NSManaged public var fax: Bool
    @NSManaged public var paperSizeMax: String?
    @NSManaged public var resources: String?

}

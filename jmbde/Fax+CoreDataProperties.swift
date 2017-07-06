//
//  Fax+CoreDataProperties.swift
//  jmbde
//
//  Created by Jürgen Mülbert on 06.07.17.
//  Copyright © 2017 Jürgen Mülbert. All rights reserved.
//

import Foundation
import CoreData


extension Fax {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Fax> {
        return NSFetchRequest<Fax>(entityName: "Fax")
    }

    @NSManaged public var number: String?
    @NSManaged public var resources: String?
    @NSManaged public var rel_Printer: Printer?

}

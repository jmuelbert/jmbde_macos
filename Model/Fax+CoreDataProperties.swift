//
//  Fax+CoreDataProperties.swift
//  
//
//  Created by Jürgen Mülbert on 29.07.17.
//
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

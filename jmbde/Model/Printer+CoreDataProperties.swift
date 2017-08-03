//
//  Printer+CoreDataProperties.swift
//  
//
//  Created by Jürgen Mülbert on 29.07.17.
//
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
    @NSManaged public var rel_Computer: Computer?
    @NSManaged public var rel_Fax: Printer?

}

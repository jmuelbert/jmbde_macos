//
//  OS+CoreDataProperties.swift
//  
//
//  Created by Jürgen Mülbert on 29.07.17.
//
//

import Foundation
import CoreData


extension OS {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OS> {
        return NSFetchRequest<OS>(entityName: "OS")
    }

    @NSManaged public var osName: String?
    @NSManaged public var rel_Computer: Computer?

}

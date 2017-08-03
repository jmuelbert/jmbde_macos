//
//  Software+CoreDataProperties.swift
//  
//
//  Created by Jürgen Mülbert on 29.07.17.
//
//

import Foundation
import CoreData


extension Software {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Software> {
        return NSFetchRequest<Software>(entityName: "Software")
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var fix: String?
    @NSManaged public var name: String?
    @NSManaged public var revision: String?
    @NSManaged public var timeStamp: String?
    @NSManaged public var version: String?

}

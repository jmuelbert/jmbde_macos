//
//  Software+CoreDataProperties.swift
//  jmbde
//
//  Created by Jürgen Mülbert on 06.07.17.
//  Copyright © 2017 Jürgen Mülbert. All rights reserved.
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

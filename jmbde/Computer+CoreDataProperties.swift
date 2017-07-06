//
//  Computer+CoreDataProperties.swift
//  jmbde
//
//  Created by Jürgen Mülbert on 06.07.17.
//  Copyright © 2017 Jürgen Mülbert. All rights reserved.
//

import Foundation
import CoreData


extension Computer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Computer> {
        return NSFetchRequest<Computer>(entityName: "Computer")
    }

    @NSManaged public var memory: Int16
    @NSManaged public var screen: String?
    @NSManaged public var rel_OS: OS?
    @NSManaged public var rel_Printer: Printer?
    @NSManaged public var rel_Software: NSSet?
    @NSManaged public var rel_Processor: Processor?

}

// MARK: Generated accessors for rel_Software
extension Computer {

    @objc(addRel_SoftwareObject:)
    @NSManaged public func addToRel_Software(_ value: Software)

    @objc(removeRel_SoftwareObject:)
    @NSManaged public func removeFromRel_Software(_ value: Software)

    @objc(addRel_Software:)
    @NSManaged public func addToRel_Software(_ values: NSSet)

    @objc(removeRel_Software:)
    @NSManaged public func removeFromRel_Software(_ values: NSSet)

}

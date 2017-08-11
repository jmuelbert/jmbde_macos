//
//  DepartmentMO+CoreDataProperties.swift
//  
//
//  Created by Jürgen Mülbert on 08.08.17.
//
//

import Foundation
import CoreData


extension DepartmentMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DepartmentMO> {
        return NSFetchRequest<DepartmentMO>(entityName: "Department")
    }

    @NSManaged public var name: String?
    @NSManaged public var city: String?
    @NSManaged public var state: String?
    @NSManaged public var zipCode: String?
    @NSManaged public var members: NSSet?
    @NSManaged public var building: BuildingMO?

}

// MARK: Generated accessors for members
extension DepartmentMO {

    @objc(addMembersObject:)
    @NSManaged public func addToMembers(_ value: EmployeeMO)

    @objc(removeMembersObject:)
    @NSManaged public func removeFromMembers(_ value: EmployeeMO)

    @objc(addMembers:)
    @NSManaged public func addToMembers(_ values: NSSet)

    @objc(removeMembers:)
    @NSManaged public func removeFromMembers(_ values: NSSet)

}

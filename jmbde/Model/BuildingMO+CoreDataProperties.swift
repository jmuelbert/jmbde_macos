//
//  BuildingMO+CoreDataProperties.swift
//  
//
//  Created by Jürgen Mülbert on 08.08.17.
//
//

import Foundation
import CoreData


extension BuildingMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BuildingMO> {
        return NSFetchRequest<BuildingMO>(entityName: "Building")
    }

    @NSManaged public var name: String?
    @NSManaged public var departments: NSSet?

}

// MARK: Generated accessors for departments
extension BuildingMO {

    @objc(addDepartmentsObject:)
    @NSManaged public func addToDepartments(_ value: DepartmentMO)

    @objc(removeDepartmentsObject:)
    @NSManaged public func removeFromDepartments(_ value: DepartmentMO)

    @objc(addDepartments:)
    @NSManaged public func addToDepartments(_ values: NSSet)

    @objc(removeDepartments:)
    @NSManaged public func removeFromDepartments(_ values: NSSet)

}

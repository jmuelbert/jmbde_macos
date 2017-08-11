//
//  EmployeeMO+CoreDataProperties.swift
//  
//
//  Created by Jürgen Mülbert on 08.08.17.
//
//

import Foundation
import CoreData


extension EmployeeMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EmployeeMO> {
        return NSFetchRequest<EmployeeMO>(entityName: "Employee")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var hasDrivingLicense: Bool
    @NSManaged public var hireDate: NSDate?
    @NSManaged public var identiefier: String?
    @NSManaged public var manager: Bool
    @NSManaged public var title: String?
    @NSManaged public var department: DepartmentMO?

}

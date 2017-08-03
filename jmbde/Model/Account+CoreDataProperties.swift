//
//  Account+CoreDataProperties.swift
//  
//
//  Created by Jürgen Mülbert on 29.07.17.
//
//

import Foundation
import CoreData


extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account")
    }

    @NSManaged public var active: Bool
    @NSManaged public var created: NSDate?
    @NSManaged public var passWord: String?
    @NSManaged public var timeStamp: NSDate?
    @NSManaged public var userName: String?
    @NSManaged public var rel_Company: Company?
    @NSManaged public var rel_Employee: Employee?

}

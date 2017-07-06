//
//  Account+CoreDataProperties.swift
//  jmbde
//
//  Created by Jürgen Mülbert on 06.07.17.
//  Copyright © 2017 Jürgen Mülbert. All rights reserved.
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

}

//
//  Person+CoreDataProperties.swift
//  jmbde
//
//  Created by Jürgen Mülbert on 06.07.17.
//  Copyright © 2017 Jürgen Mülbert. All rights reserved.
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var address: String?
    @NSManaged public var address2: String?
    @NSManaged public var birthDay: NSDate?
    @NSManaged public var eMail: String?
    @NSManaged public var firstName: String?
    @NSManaged public var gender: String?
    @NSManaged public var lastName: String?
    @NSManaged public var middleName: String?
    @NSManaged public var mobile: String?
    @NSManaged public var phone: String?
    @NSManaged public var rel_City: City?
    @NSManaged public var rel_Title: Title?

}

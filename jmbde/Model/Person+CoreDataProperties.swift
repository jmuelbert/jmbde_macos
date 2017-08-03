//
//  Person+CoreDataProperties.swift
//  
//
//  Created by Jürgen Mülbert on 29.07.17.
//
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

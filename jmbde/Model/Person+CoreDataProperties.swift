//
//  Person+CoreDataProperties.swift
//  
//
//  Created by Jürgen Mülbert on 08.08.17.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var birthDate: NSDate?
    @NSManaged public var name: String?

}

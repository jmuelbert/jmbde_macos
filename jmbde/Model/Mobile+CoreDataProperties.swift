//
//  Mobile+CoreDataProperties.swift
//  
//
//  Created by Jürgen Mülbert on 29.07.17.
//
//

import Foundation
import CoreData


extension Mobile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mobile> {
        return NSFetchRequest<Mobile>(entityName: "Mobile")
    }

    @NSManaged public var activateDate: String?
    @NSManaged public var cardNumber: String?
    @NSManaged public var number: String?
    @NSManaged public var pin: String?
    @NSManaged public var puk: String?
    @NSManaged public var puk2: String?

}

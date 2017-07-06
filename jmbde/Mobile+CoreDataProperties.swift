//
//  Mobile+CoreDataProperties.swift
//  jmbde
//
//  Created by Jürgen Mülbert on 06.07.17.
//  Copyright © 2017 Jürgen Mülbert. All rights reserved.
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

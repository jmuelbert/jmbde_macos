//
//  Phone+CoreDataProperties.swift
//  jmbde
//
//  Created by Jürgen Mülbert on 06.07.17.
//  Copyright © 2017 Jürgen Mülbert. All rights reserved.
//

import Foundation
import CoreData


extension Phone {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Phone> {
        return NSFetchRequest<Phone>(entityName: "Phone")
    }

    @NSManaged public var number: String?
    @NSManaged public var pin: String?

}

//
//  OS+CoreDataProperties.swift
//  jmbde
//
//  Created by Jürgen Mülbert on 06.07.17.
//  Copyright © 2017 Jürgen Mülbert. All rights reserved.
//

import Foundation
import CoreData


extension OS {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OS> {
        return NSFetchRequest<OS>(entityName: "OS")
    }

    @NSManaged public var osName: String?

}

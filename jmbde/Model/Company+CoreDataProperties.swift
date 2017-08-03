//
//  Company+CoreDataProperties.swift
//  
//
//  Created by Jürgen Mülbert on 29.07.17.
//
//

import Foundation
import CoreData


extension Company {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Company> {
        return NSFetchRequest<Company>(entityName: "Company")
    }

    @NSManaged public var businessMail: String?
    @NSManaged public var cphone: String?
    @NSManaged public var created: NSDate?
    @NSManaged public var fax: String?
    @NSManaged public var name: String?
    @NSManaged public var name2: String?
    @NSManaged public var timeStamp: NSDate?
    @NSManaged public var rel_Employee: Employee?
    @NSManaged public var rel_Fax: Fax?
    @NSManaged public var rel_Phone: Phone?
    @NSManaged public var rel_Printer: Printer?
    @NSManaged public var rel_Account: Account?
    @NSManaged public var rel_ChipCardDoor: ChipcardDoor?
    @NSManaged public var rel_ChipCardProfile: ChipcardProfile?
    @NSManaged public var rel_Place: Place?
    @NSManaged public var rel_Device: Device?

}

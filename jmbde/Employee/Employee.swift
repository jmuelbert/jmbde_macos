//
//  Employee.swift
//  jmbde
//
//  Created by Jürgen Mülbert on 28.07.17.
//  Copyright © 2017 Jürgen Mülbert. All rights reserved.
//

import Foundation
import Cocoa

class Employee: NSObject {
    dynamic var firstName: String?
    dynamic var lastName: String?
    dynamic var image: NSImage?
    dynamic var jobRole: String?
    
    func addLastName(ln: String?) {
        self.lastName = ln
    }
    
    func addName(fn: String?, ln: String?) {
        self.firstName = fn
        self.lastName = ln
    }
    
}

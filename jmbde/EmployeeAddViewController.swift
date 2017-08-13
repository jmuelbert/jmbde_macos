//
//  EmployeeAddViewController.swift
//  jmbde
//
//  Created by Jürgen Mülbert on 30.07.17.
//  Copyright © 2017 Jürgen Mülbert. All rights reserved.
//

import Cocoa
import CoreData

class EmployeeAddViewController: NSViewController {

    // var employeesArray = [EmployeeMO]()
    
    @IBOutlet weak var firstNameTextField: NSTextField!

    @IBOutlet weak var lastNameTextField: NSTextField!

    
    @IBAction func saveAction(_ sender: Any) {
        let lastName = lastNameTextField.stringValue
        let firstName = firstNameTextField.stringValue
        
        
        if lastName.isEmpty {
            let alert = NSAlert()
            alert.messageText = "The Lastname can not be empty"
            alert.alertStyle = NSAlertStyle.critical
            alert.addButton(withTitle: "Cancel")
            alert.runModal()
            self.dismissViewController(self)
        } else {
            let appdelegate = NSApplication.shared().delegate as! AppDelegate
            let context = appdelegate.persistentContainer.viewContext
            let newEmployee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context)
            newEmployee.setValue(lastName, forKey: "lastName")
            newEmployee.setValue(firstName, forKey: "firstName")
            do {
                try context.save()
            } catch {}

        }
        self.dismissViewController(self)
    }
    
    
    @IBAction func cancelAction(_ sender: Any) {
        self.dismissViewController(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
    }
    
}

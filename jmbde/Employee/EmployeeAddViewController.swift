//
//  EmployeeAddViewController.swift
//  jmbde
//
//  Created by Jürgen Mülbert on 30.07.17.
//  Copyright © 2017 Jürgen Mülbert. All rights reserved.
//

import Cocoa

class EmployeeAddViewController: NSViewController {

    var employeesArray = [Employee]()
    
    @IBOutlet weak var firstNameTextField: NSTextField!
    @IBOutlet weak var lastNameTextField: NSTextField!


    @IBAction func saveAction(_ sender: Any) {
        let saveLastName = lastNameTextField.stringValue
        let saveFirstName = firstNameTextField.stringValue
        
        if saveLastName.isEmpty {
            let alert = NSAlert()
            alert.messageText = "The Lastname can not be empty"
            alert.alertStyle = NSAlertStyle.critical
            alert.addButton(withTitle: "Cancel")
            alert.runModal()
            self.dismiss(self)
        } else {
            let emp = Employee()
            emp.firstName = saveFirstName
            emp.lastName = saveLastName
            
            employeesArray.append(emp)
        }
        self.dismiss(nil)    }
    
    
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
    }
    
}

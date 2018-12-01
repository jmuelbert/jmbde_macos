/**************************************************************************
 **
 ** EmployeeAddViewController.swift
 **
 ** Copyright (c) 2016-2018 Jürgen Mülbert. All rights reserved.
 **
 ** This file is part of JMBde
 **
 ** Licensed under the EUPL, Version 1.2 or – as soon they
 ** will be approved by the European Commission - subsequent
 ** versions of the EUPL (the "Licence");
 ** You may not use this work except in compliance with the
 ** Licence.
 ** You may obtain a copy of the Licence at:
 **
 ** https://joinup.ec.europa.eu/page/eupl-text-11-12
 **
 ** Unless required by applicable law or agreed to in
 ** writing, software distributed under the Licence is
 ** distributed on an "AS IS" basis,
 ** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 ** express or implied.
 ** See the Licence for the specific language governing
 ** permissions and limitations under the Licence.
 **
 ** Lizenziert unter der EUPL, Version 1.2 oder - sobald
 **  diese von der Europäischen Kommission genehmigt wurden -
 ** Folgeversionen der EUPL ("Lizenz");
 ** Sie dürfen dieses Werk ausschließlich gemäß
 ** dieser Lizenz nutzen.
 ** Eine Kopie der Lizenz finden Sie hier:
 **
 ** https://joinup.ec.europa.eu/page/eupl-text-11-12
 **
 ** Sofern nicht durch anwendbare Rechtsvorschriften
 ** gefordert oder in schriftlicher Form vereinbart, wird
 ** die unter der Lizenz verbreitete Software "so wie sie
 ** ist", OHNE JEGLICHE GEWÄHRLEISTUNG ODER BEDINGUNGEN -
 ** ausdrücklich oder stillschweigend - verbreitet.
 ** Die sprachspezifischen Genehmigungen und Beschränkungen
 ** unter der Lizenz sind dem Lizenztext zu entnehmen.
 **
 **************************************************************************/

import Cocoa
import CoreData

class EmployeeAddViewController: NSViewController {

    var employeesArray = [EmployeeMO]()

    @IBOutlet weak private var firstNameTextField: NSTextField!

    @IBOutlet weak private var lastNameTextField: NSTextField!

    @IBAction private func saveAction(_ sender: Any) {
        let lastName = lastNameTextField.stringValue
        let firstName = firstNameTextField.stringValue

        if lastName.isEmpty {
            let alert = NSAlert()
            alert.messageText = "The Lastname can not be empty"
            alert.alertStyle = NSAlert.Style.critical
            alert.addButton(withTitle: "Cancel")
            alert.runModal()
            self.dismiss(self)
        } else {
            let appdelegate = NSApplication.shared.delegate as? AppDelegate
            let context = appdelegate?.persistentContainer.viewContext
            let newEmployee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context!)
            newEmployee.setValue(lastName, forKey: "lastName")
            newEmployee.setValue(firstName, forKey: "firstName")
            do {
                try context?.save()
            } catch {}
        }
        self.dismiss(self)
    }

    @IBAction private func cancelAction(_ sender: Any) {
        self.dismiss(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }

}

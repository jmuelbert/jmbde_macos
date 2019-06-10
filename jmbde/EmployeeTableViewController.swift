/**************************************************************************
 **
 ** EmployeeTableViewController.swift
 **
 ** Copyright (c) 2016-2019 Jürgen Mülbert. All rights reserved.
 **
 ** This file is part of jmbde
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

class EmployeeTableViewController: NSViewController {

    @IBOutlet weak private var tableView: NSTableView!

    var employees: [EmployeeMO] = []

    @IBAction private func addEmployeeAction(_ sender: Any) {
        let empS = NSStoryboardSegue.Identifier("EmployeeAddSeque")
        performSegue(withIdentifier: empS, sender: sender)
        self.tableView.reloadData()
    }

    @IBAction private func removeEmployee(_ sender: Any) {
    }

    func requestData() {
        let appdelegate = NSApplication.shared.delegate as? AppDelegate
        let context = appdelegate?.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        request.returnsObjectsAsFaults = false
        do {
            employees = (try context?.fetch(request) as? [EmployeeMO])!
            if !employees.isEmpty {
                for employee in employees {
                    if let firstName = (employee as AnyObject).value(forKey: "firstName") as? String {
                        print("Firstname: \(firstName)")
                    }
                    if let lastName = (employee as AnyObject).value(forKey: "lastName") as? String {
                        print("Lastname: \(lastName)")
                    }
                }
            }
        } catch {}
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView?.dataSource = self
        self.tableView?.delegate = self

        requestData()
    }

    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        _ = NSStoryboardSegue.Identifier("EmployeeAddSeque")
        switch segue.identifier {
            case _:
                let destinationAddEmployee = segue.destinationController as? EmployeeAddViewController
                destinationAddEmployee?.employeesArray = employees
            default:
                break
        }
    }

}

extension EmployeeTableViewController: NSTableViewDataSource {

    func numberOfRows(in tableView: NSTableView) -> Int {
        return employees.count
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {

        if (tableColumn?.identifier)!.rawValue == "lastName" {
            if let cell =
                tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "lastName"),
                                   owner: nil) as? NSTableCellView {
                cell.textField?.stringValue = employees[row].lastName!
                return cell
            }
        } else if (tableColumn?.identifier)!.rawValue == "firstName" {
            if let cell = tableView.makeView(withIdentifier:
                NSUserInterfaceItemIdentifier(rawValue: "firstName"),
                                             owner: nil) as? NSTableCellView {
                    cell.textField?.stringValue = employees[row].firstName!
                    return cell
            }
        }
        return nil
    }

}

extension EmployeeTableViewController: NSTableViewDelegate {

}

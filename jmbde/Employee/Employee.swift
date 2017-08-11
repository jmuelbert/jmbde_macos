//
//  EmployeeTableViewController.swift
//  jmbde
//
//  Created by Jürgen Mülbert on 15.07.17.
//  Copyright (c) 2014-2017 Jürgen Mülbert. All rights reserved.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the European Union Public License (EUPL),
// version 1.1.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// European Union Public License for more details.
//
// You should have received a copy of the European Union Public Licence
// along with this program. If not, see
// http://www.osor.eu/eupl/european-union-public-licence-eupl-v.1.1
//

import Cocoa
import CoreData


class EmployeeTableViewController: NSViewController {

        
    var employees = [Employee]()
    
    let tableViewData =
    [["firstName":"John","lastName": "Doe"],
     ["firstName":"Jana", "lastName":"Doe"]]

    @IBAction func addEmployeeAction(_ sender: Any) {
   
        performSegue(withIdentifier: "EmployeeAddSeque", sender: sender)
        
        self.tableView.reloadData()
        
    }
    
    @IBAction func removeEmployee(_ sender: Any) {
    }
    
    func RequestData() {
        let appdelegate = NSApplication.shared().delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        request.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                var emp: Employee?
                
                for result in results {
                    if let firstName = (result as AnyObject).value(forKey: "firstName") as? String {
                        emp!.firstName = firstName
                    }
                    if let lastName = (result as AnyObject).value(forKey: "lastName") as? String {
                        emp!.lastName = lastName
                    }
                    employees.append(emp!)
                }
            }
        } catch {}
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

       self.tableView?.dataSource = self
       self.tableView?.delegate = self
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmployeeAddSeque" {
            let destinationAddEmployee = segue.destinationController as? EmployeeAddViewController
            destinationAddEmployee?.employeesArray = employees
        }
    }
    
    }

extension EmployeeTableViewController: NSTableViewDataSource {

    func numberOfRows(in tableView: NSTableView) -> Int {
        return tableViewData.count
    }

    
//    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
//        return employees[row]
//    }
    
}

extension EmployeeTableViewController: NSTableViewDelegate {
    
}
    



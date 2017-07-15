//
//  MasterViewController.swift
//  jmbde
//
//  Created by Jürgen Mülbert on 14.07.17.
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

class MasterViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {
    
    // MARK: - Properties
    
    // The array controller data source of outline?
    @IBOutlet var outlineArrayController: NSArrayController!
    
    // The data source for the array controller
    @objc var outlineArrayBacking = [Outline]()
    
    // So we can inform the delegate ot table selection changes (from the user or from the array controller)
    weak var delegate: MasterViewControllerDelegate?
    
    // MARK: - View Controller Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButtons()
        
        // Changing the backed array alone won't update the array controller, so set the array controller content.
        let indexes = IndexSet(integersIn: 0..<outlineArrayBacking.count)
        outlineArrayController.willChange(.setting, valuesAt: indexes, forKey: "content")
        outlineArrayController.content = outlineArrayBacking
        outlineArrayController.didChange(.setting, valuesAt: indexes, forKey: "content")
        
        // Listen for when the array controller changes it's selection
        outlineArrayController.addObserver(self,
                                           forKeyPath: "selectionIndexes",
                                           options: .new,
                                           context: nil)
    }
    
    // MARK: - NSTableViewDatasSurce
    
    public func numberOfRows(in tableView: NSTableView) -> Int {
        return (outlineArrayController.arrangedObjects as AnyObject).count
    }
    
    public func tableView(_ tableView: NSTableView, isGroupRow row: Int) -> Bool {
        var result = false
        if let example = (outlineArrayController.arrangedObjects as AnyObject).object(at: row) as? Outline {
            // A group row has now view controller
            result = example.viewControllerIdentifier.characters.isEmpty
        }
        return result
    }
    
    // MARK: - NSTableViewDelegate
    public func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let example = (outlineArrayController.arrangedObjects as AnyObject).object(at: row) as? Outline else { return nil }
        
        // A group row has now view controller
        if example.viewControllerIdentifier.characters.isEmpty {
            guard let cell =  tableView.make(withIdentifier: "GroupCell", owner: self) as? NSTextField else {
                return nil
            }
            cell.stringValue = example.name
            return cell
        } else {
            guard let cell = tableView.make(withIdentifier: "MainCell", owner: self) as? NSTableCellView else {
                return nil
            }
            cell.textField?.stringValue = example.name
            return cell
        }
    }
    
    
    // MARK: - KVO
    
    /**
        Used for observing for NSArrayController selection changes:
        (selection changes as a result of filtering (user search) will not send NSTableViewControllerDidCahngeNotification)
 
        so we handle it right here to help the target or detail view controller.
    */
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath! == "selectionIndexes" {
            // Obtain the selection index from our array controller.
            if let arrayController = object as? NSArrayController {
                if arrayController.selectionIndex == NSNotFound {
                    delegate!.didChangeOutlineSelection(masterViewController: self, selection: nil)
                } else {
                    if delegate != nil {
                        let viewControllers = outlineArrayController.arrangedObjects as? AnyObject
                        if let example =
                            viewControllers?.object(at: arrayController.selectionIndex) as? Outline {
                            delegate!.didChangeOutlineSelection(masterViewController: self, selection: example)
                        }
                    }
                }
            } else {
                super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
            }
        }
    }
    
    // MARK - Table Configuration
    
    fileprivate func addButtons() {
        outlineArrayBacking.append(Outline(name: NSLocalizedString("MasterList", comment: "The Master List"),
                                           description: "",
                                           viewControllerIdentifier: ""))

        outlineArrayBacking.append(Outline(name: NSLocalizedString("Employees", comment: "List Employees"),
                                           description: "",
                                           viewControllerIdentifier: "EmployeeTableViewController"))
        
        outlineArrayBacking.append(Outline(name: NSLocalizedString("Computers", comment: "List Computers"),
                                           description: "",
                                           viewControllerIdentifier: "ComputerTableController"))
        
        outlineArrayBacking.append(Outline(name: NSLocalizedString("Printers", comment: "List Printers"),
                                           description: "",
                                           viewControllerIdentifier: "PrinterTableController"))

        outlineArrayBacking.append(Outline(name: NSLocalizedString("Phones", comment: "List Phones"),
                                           description: "",
                                           viewControllerIdentifier: "PhoneTableController"))

        outlineArrayBacking.append(Outline(name: NSLocalizedString("Mobile", comment: "List Mobiles"),
                                           description: "",
                                           viewControllerIdentifier: "MobileTableController"))

        outlineArrayBacking.append(Outline(name: NSLocalizedString("Departments", comment: "List Departments"),
                                           description: "",
                                           viewControllerIdentifier: "DepartmentTableController"))

        outlineArrayBacking.append(Outline(name: NSLocalizedString("Place", comment: "List Places"),
                                           description: "",
                                           viewControllerIdentifier: "PlaceableController"))

        outlineArrayBacking.append(Outline(name: NSLocalizedString("Function", comment: "List Functions"),
                                           description: "",
                                           viewControllerIdentifier: "FunctionTableController"))

        
        
    }
    
    
}

protocol MasterViewControllerDelegate : class {
    func didChangeOutlineSelection(masterViewController: MasterViewController, selection: Outline?) 
}
    
    
    

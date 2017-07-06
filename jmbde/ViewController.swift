//
//  ViewController.swift
//  jmbde
//
//  Created by Jürgen Mülbert on 01.07.17.
//  Copyright © 2017 Jürgen Mülbert. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSOutlineViewDataSource, NSOutlineViewDelegate {

    @IBOutlet weak var outlineView: NSOutlineView!
    
    @IBOutlet var treeController: NSTreeController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addData()
        outlineView.expandItem(nil, expandChildren: true)
        outlineView.register(forDraggedTypes: [NSPasteboardTypeString])
        outlineView.deselectRow(0)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func addData() {
        let root = [
        "name": "Data",
        "isLeaf": false
        ] as [String : Any]
        
        let dict: NSMutableDictionary = NSMutableDictionary(dictionary: root)
        let employee = SourceList()
        employee.name = "Employee"
        let computer = SourceList()
        computer.name = "Computer"
        let printer = SourceList()
        printer.name = "Printer"
        let phone = SourceList()
        phone.name = "Phone"
        let mobile = SourceList()
        mobile.name = "Mobile"
        dict.setObject([employee,
                        computer,
                        printer,
                        phone,
                        mobile
                        ], forKey: "children" as NSCopying)
        treeController.addObject(dict)
        
        
    }
    
    // MARK: - Helpers
    func isHeader(item: AnyObject) -> Bool {
        if let item = item as? NSTreeNode {
            return !(item.representedObject is SourceList)
        } else {
            return !(item.representedObject is SourceList)
        }
    }
    
    // MARK: - Delegate
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        if isHeader(item: item as AnyObject) {
            return outlineView.make(withIdentifier: "HeaderCell", owner: self)
        } else {
            return outlineView.make(withIdentifier: "DataCell", owner: self)
        }
    }
    
    func outlineView(_ outlineView: NSOutlineView, isGroupItem item: Any) -> Bool {
        return isHeader(item: true as AnyObject)
    }
    
    func outlineView(_ outlineView: NSOutlineView, shouldSelectItem item: Any) -> Bool {
        return !isHeader(item: item as AnyObject)
    }
    
    func outlineView(_ outlineView: NSOutlineView, shouldShowOutlineCellForItem item: Any) -> Bool {
        return !isHeader(item: item as AnyObject)
    }
    
    func outlineView(_ outlineView: NSOutlineView, didClick tableColumn: NSTableColumn) {
        
    }
    
    // MARK: Datasource
    func outlineView(_ outlineView: NSOutlineView, pasteboardWriterForItem item: Any) -> NSPasteboardWriting? {
        let pbItem = NSPasteboardItem()
        
        if let sourcelist = ((item as? NSTreeNode)?.representedObject) as? SourceList {
            pbItem.setString(sourcelist.name, forType: NSPasteboardTypeString)
            return pbItem
        }
        return nil
    }
    
    func outlineView(_ outlineView: NSOutlineView, validateDrop info: NSDraggingInfo, proposedItem item: Any?, proposedChildIndex index: Int) -> NSDragOperation {
        
        let canDrag = index >= 0 && item != nil
        
        if canDrag {
            return NSDragOperation.move
        } else {
            return NSDragOperation(rawValue: 0)
        }
    }
    
    // TODO: Code is not valid!
    /*
    func outlineView(outlineView: NSOutlineView, acceptDrop info: NSDraggingInfo, item: AnyObject?, childIndex index: Int) -> Bool {
        let pb = info.draggingPasteboard()
        let name = pb.string(forType: NSPasteboardTypeString)
        
        var sourceNode: NSTreeNode?
        
        if let item = item as? NSTreeNode, item.children != nil {
            for node in item.children! {
                if let sourcelist = node.representedObject as? SourceList {
                    if sourcelist.name == name {
                        sourceNode = node
                    }
                }
            }
        }
        if sourceNode == nil {
            return false
        }
        
        let fromIndexPath = treeController.selectionIndexPath
        
        let indexArr: [Int] = [0, index]
        let toIndexPath = NSIndexPath(indexes: indexArr, length: 2)
        treeController.move(sourceNode!, to: toIndexPath as IndexPath)
        
        undoManager?.prepareWithInvocationTarget(self).reverse(sourceNode, fromIndexPath: fromIndexPath)
        undoManager?.setActionName("Move")
        
        return true
    }
    
    func reverse(sourceNode: NSTreeNode?, fromIndexPath: NSIndexPath?) {
        treeController.move(sourceNode!, to: fromIndexPath! as IndexPath)
    }
    */
}

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

/**
 The MasterViewController
 
 :extends: NSViewController
 */
class MasterViewController: NSViewController {
    
    // MARK: - Properties
    var outlineItem: OutlineItem!
    var recentItensObserver: NSObjectProtocol!

    // The OutlineView
    @IBOutlet weak var outlineView: NSOutlineView!

    /**
      The Notification-Identifier-String
     */
    static let OutlineNotification = "outlineNotification"
    
    /**
      The SourceListHeader is doubleCliked
    
       - parameters:
           - sender: contains NSOutlineView
     
      - returns:
            - Nothing
    */
    @IBAction func doubleClickItem(_ sender: NSOutlineView) {
        let item = sender.item(atRow: sender.clickedRow)
        
        if item is Outline {
            if sender.isExpandable(item) {
                sender.collapseItem(item)
            } else {
                sender.expandItem(item)
            }
        }
    }
    

    override func keyDown(with event: NSEvent) {
        interpretKeyEvents([event])
    }
    
     
    // The data source for the outline array
    var outlines = [Outline]()
    
    // So we can inform the delegate ot table selection changes (from the user or from the array controller)
    weak var delegate: MasterViewControllerDelegate?
    
    // MARK: - View Controller Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        recentItensObserver = NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "de.juergen-muelbert.jmbde.openView"), object: nil, queue: nil, using: openView)
    
        if let filePath = Bundle.main.path(forResource: "OutlineList", ofType: "plist") {
            outlines = Outline.outlineList(filePath)
        }

    }
    
    func openView(_ notification: Notification) {
        self.outlineView.reloadData();
    }

}

// MARK: Datasource
extension MasterViewController : NSOutlineViewDataSource {
    
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        if let outline = item as? Outline {
            return outline.children.count
        }
        return outlines.count
    }
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if let outline = item as? Outline {
            return outline.children[index]
        }
        return outlines[index]
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        if let outline = item as? Outline {
            return outline.children.count > 0
        }
        return false
    }
}

// MARK: - Delegate
extension MasterViewController: NSOutlineViewDelegate {
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        var view: NSTableCellView?
        
        if let outline = item as? Outline {
            if tableColumn?.identifier == "Data" {
                view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "HeaderCell"), owner: self) as? NSTableCellView
                if let textField = view?.textField {
                    textField.stringValue = outline.name
                    // textField.sizeToFit()
                }
            }
        } else if let outlineItem = item as? OutlineItem {
            if tableColumn?.identifier == "Data" {
                view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "DataColumn"), owner: self) as? NSTableCellView
                if let textField = view?.textField {
                    textField.stringValue = outlineItem.title
                    textField.sizeToFit()
                }
            } else if tableColumn?.identifier == "ImageCell" {
                view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "ImageCell"), owner: self) as? NSTableCellView
                if let image = view?.imageView {
                    image.image = NSImage(named: NSImage.Name(rawValue: outlineItem.image))
                    image.sizeToFit()
                }
            }
        }
        
        return view
    }
    
    func outlineView(_ outlineView: NSOutlineView, shouldEdit tableColumn: NSTableColumn?, item: Any) -> Bool {
        return false
    }
    
    
    func outlineViewSelectionDidChange(_ notification: Notification) {
        guard let outlineView = notification.object as? NSOutlineView else {
            return
        }
        
        let selectedIndex = outlineView.selectedRow
        
        if let outlineItem = outlineView.item(atRow: selectedIndex) as? OutlineItem {
            self.outlineItem = outlineItem
            NotificationCenter.default.post(Notification.init(name: Notification.Name(rawValue: "de.juergen-muelbert.jmbde.changeView"), object: self))
        }
   }
    
    
    func outlineViewSelectionIsChanging(_ notification: Notification) {
        NSLog("Selection changed")
    }


    
    // MARK: KVO
    // override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    //    super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
    // }
}

// MARK: - Protocol
///
/// The Protocol - Interface for the Message to the Controller
protocol MasterViewControllerDelegate : class {
    func didChangeOutlineSelection(masterViewController: MasterViewController, selection: OutlineItem?)
}

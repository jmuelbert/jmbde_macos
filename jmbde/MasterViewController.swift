/**************************************************************************
 **
 ** MasterViewController.swift
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

/**
 * The MasterViewController
 *
 * :extends: NSViewController
 */
class MasterViewController: NSViewController {

    // MARK: - Properties
    var outlineItem: OutlineItem!
    var recentItensObserver: NSObjectProtocol!

    // The OutlineView
    @IBOutlet weak private var outlineView: NSOutlineView!

    // Dummy data used for row titles
    // var outlines = ["First item", "Second item", "Third item", "Next Item"]

    // The data source for the outline array
    fileprivate var outlines = Outline.outlineList(Bundle.main.path(forResource: "OutlineList", ofType: "plist")!)

    /**
     The Notification-Identifier-String
     */
    static let OutlineNotification = "outlineNotification"

    /**
     * The SourceListHeader is doubleCliked
     *
     *  - parameters:
     *      - sender: contains NSOutlineView
     *
     * - returns:
     *       - Nothing
     */
    @IBAction private func doubleClickItem(_ sender: NSOutlineView) {
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

    // So we can inform the delegate ot table selection changes (from the user or from the array controller)
    weak var delegate: MasterViewControllerDelegate?

    // MARK: - View Controller Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup notification for window losing and gaining focus
        recentItensObserver = NotificationCenter.default.addObserver(
            forName: Notification.Name(rawValue: "de.juergen-muelbert.jmbde.openView"),
            object: nil, queue: nil, using: openView)

    }

    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }

    func openView(_ notification: Notification) {
        self.outlineView.reloadData()
    }

}

// MARK: Datasource
extension MasterViewController: NSOutlineViewDataSource {

    // Number of items in the sidebar
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        if let outline = item as? Outline {
            NSLog("Count of Children \(outline.children.count)")
            return outline.children.count
        }
        print ("Count ouf Entries \(outlines.count)")
        return outlines.count
    }

    // Items to be added to sidebar
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if let outline = item as? Outline {
            return outline.children[index]
        }
        return outlines[index]
    }

  // Whether rows are expandable by an arrow
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        if let outline = item as? Outline {
            return !outline.children.isEmpty
        }
        return false
    }

}

// MARK: - Delegate
extension MasterViewController: NSOutlineViewDelegate {

    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        var view: NSTableCellView?

        if let outline = item as? Outline {
            if (tableColumn?.identifier)!.rawValue == "OutlineColItem" {
                view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(
                    rawValue: "ItemCell"), owner: self) as? NSTableCellView
                if let textField = view?.textField {
                    textField.stringValue = outline.name
                    textField.sizeToFit()
                }
            }
        } else if let outlineItem = item as? OutlineItem {
            if (tableColumn?.identifier)!.rawValue == "OutlineColItem" {
                view = outlineView.makeView(
                    withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "ItemCell"),
                    owner: self) as? NSTableCellView
                if let textField = view?.textField {
                    textField.stringValue = outlineItem.title
                    textField.sizeToFit()
                }
            } else if (tableColumn?.identifier)!.rawValue == "OutlineColItem" {
                view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(
                        rawValue: "ImageCell"), owner: self) as? NSTableCellView
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

        NSLog("ViewSelectionDidChange Index: \(selectedIndex)")

        if let outlineItem = outlineView.item(atRow: selectedIndex) as? OutlineItem {
            self.outlineItem = outlineItem

            NSLog("ViewSelectionDidChange (outlineitem) \(outlineItem)")
            NotificationCenter.default.post(Notification.init(name: Notification.Name(
                rawValue: "de.juergen-muelbert.jmbde.changeView"), object: self))
        }
   }

    func outlineViewSelectionIsChanging(_ notification: Notification) {
        NSLog("Selection changed")
    }

    // MARK: KVO
    // override func observeValue(forKeyPath keyPath: String?, of object: Any?,
    //  change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    //  super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
    // }

}

// MARK: - Protocol
///
/// The Protocol - Interface for the Message to the Controller
protocol MasterViewControllerDelegate: class {
    func didChangeOutlineSelection(masterViewController: MasterViewController, selection: OutlineItem?)
}

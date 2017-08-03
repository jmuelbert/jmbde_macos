//
//  SplitViewController.swift
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

class SplitViewController: NSSplitViewController {

    var masterViewController: MasterViewController!
    var detailViewController: DetailViewController!
    
    var updateSeque: NSObjectProtocol!

    // MARK: - View Controller LIfecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
 
        // Note: we keep the left split view item from growing as the window
        // grows by setting its hugging priority to 200,
        // and the right to 199. The view with the lowest priority will be the
        // first to take on additional with the
        // split view grows ir shrinks-
        splitView.adjustSubviews()
        
        updateSeque = NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "de.juergenmuelbert.changeView"), object: nil, queue: nil, using: setSeque)
        masterViewController = splitViewItems[0].viewController as? MasterViewController
        masterViewController.delegate = self as? MasterViewControllerDelegate // Listen for table view selection changes
  
        
        if let detailViewController = splitViewItems[1].viewController as? DetailViewController {
            self.detailViewController = detailViewController
        } else {
            fatalError("SplitViewController is not configured correctly.")
        }
        
        splitView.autosaveName = "SplitViewAutoSave" // Remember the split view position
        
    }
    
    // MARK: - MasterViweControllerDelegate
 
    ///
    /// Handle the selection in the Menu
    /// - When click an entry change here the selection
    /// @param masterViewController
    /// @param selection
    ///

    func setSeque(_ notification: Notification) {
        if let controller = notification.object as? MasterViewController {
            let selection = controller.outlineItem
            detailViewController.detailItemRecord = selection
            print("Change to: %s and the Controller %s",selection?.title, selection?.viewControllerIdentifier)
        }
    }
 
}

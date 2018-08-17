/**************************************************************************
**
** SplitViewController.swift
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

class SplitViewController: NSSplitViewController {

    var masterViewController: MasterViewController!
    var detailViewController: DetailViewController!

    var updateSeque: NSObjectProtocol!

    // MARK: - View Controller Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Note: we keep the left split view item from growing as the window
        // grows by setting its hugging priority to 200,
        // and the right to 199. The view with the lowest priority will be the
        // first to take on additional with the
        // split view grows ir shrinks-
        splitView.adjustSubviews()

        updateSeque = NotificationCenter.default.addObserver(
            forName: Notification.Name(rawValue: "de.juergen-muelbert.jmbde.changeView"),
            object: nil, queue: nil, using: setSeque)
        masterViewController = splitViewItems[0].viewController as? MasterViewController
        masterViewController.delegate = self as? MasterViewControllerDelegate // Listen for table view selection changes

        NSLog("Invoked SplitView:viewDidLoad")

        if let detailViewController = splitViewItems[1].viewController as? DetailViewController {
            self.detailViewController = detailViewController
        } else {
            fatalError("SplitViewController is not configured correctly.")
        }

        // Remember the split view position
        splitView.autosaveName = NSSplitView.AutosaveName(rawValue: "SplitViewAutoSave")

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
        }
    }

}

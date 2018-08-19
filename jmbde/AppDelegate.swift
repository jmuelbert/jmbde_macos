//
//  AppDelegate.swift
//  JMBde
//
// Copyright (c) 2016-2018 Jürgen Mülbert. All rights reserved.
//
// This file is part of JMBde
//
// Licensed under the EUPL, Version 1.2 or – as soon they
// will be approved by the European Commission - subsequent
// versions of the EUPL (the "Licence");
// You may not use this work except in compliance with the
// Licence.
// You may obtain a copy of the Licence at:
//
// https://joinup.ec.europa.eu/page/eupl-text-11-12
//
// Unless required by applicable law or agreed to in
// writing, software distributed under the Licence is
// distributed on an "AS IS" basis,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied.
// See the Licence for the specific language governing
// permissions and limitations under the Licence.
//
// Lizenziert unter der EUPL, Version 1.2 oder - sobald
//  diese von der Europäischen Kommission genehmigt wurden -
// Folgeversionen der EUPL ("Lizenz");
// Sie dürfen dieses Werk ausschließlich gemäß
// dieser Lizenz nutzen.
// Eine Kopie der Lizenz finden Sie hier:
//
// https://joinup.ec.europa.eu/page/eupl-text-11-12
//
// Sofern nicht durch anwendbare Rechtsvorschriften
// gefordert oder in schriftlicher Form vereinbart, wird
// die unter der Lizenz verbreitete Software "so wie sie
// ist", OHNE JEGLICHE GEWÄHRLEISTUNG ODER BEDINGUNGEN -
// ausdrücklich oder stillschweigend - verbreitet.
// Die sprachspezifischen Genehmigungen und Beschränkungen
// unter der Lizenz sind dem Lizenztext zu entnehmen.
//

import AppCenter
import AppCenterAnalytics
import AppCenterCrashes
import Cocoa

/// The AppDelegate
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    /// The Reference to the MasterViewController
    var masterViewController: MasterViewController?

    /// applicationDidFinishLaunching: Overwrite for the applicationDidFinishLaunching
    /// - Parameter _:
    /// - Parameter aNotification: The Notificaton by finish launching
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    /// applicationWillTerminate: Overwrite for the applicationWillTerminate
    /// - Parameter _:
    /// - Parameter aNotification: The Notificaton befor terminate   
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    /// applicationShouldTerminateAfterLastWindowClosed: Overwrite for applicationShouldTerminateAfterLastWindowClosed
    /// - Parameter _:
    /// - Parameter sender: The sender that will the application terminate
    /// - Returns: Bool
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    // MARK: - Core Data stack
    ///
    /// Init the persistentContainer for CoreData
    ///
    ///    - returns: The container
    lazy var persistentContainer: NSPersistentContainer = {
        // The persistent container for the application. This implementation
        // creates and returns a container, having loaded the store for the
        // application to it. This property is optional since there are legitimate
        // error conditions that could cause the creation of the store to fail.
        let container = NSPersistentContainer(name: "JMBde")
        container.loadPersistentStores(completionHandler: { storeDescription, error in
            if let error = error {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate.
                // You should not use this function in a shipping application,
                // although it may be useful during development.

                // Typical reasons for an error here include:
                // The parent directory does not exist, cannot be created, or disallows writing.
                // The persistent store is not accessible, due to permissions or data protection
                // when the device is locked.
                // The device is out of space.
                // The store could not be migrated to the current model version.
                // Check the error message to determine what the actual problem was.
                fatalError("Unresolved error \(error) for \(storeDescription)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving and Undo support

    /// saveAction: Defines the SaveAction for CoreData
    /// - important: Saves only the coredata has changes.
    /// - params: sender - the sender of this Action
    @IBAction private func saveAction(_ sender: AnyObject?) {
        // Performs the save action for the application, which is to send the save:
        // message to the application's managed object context.
        // Any encountered errors are presented to the user.
        let context = persistentContainer.viewContext

        if !context.commitEditing() {
            NSLog("\(NSStringFromClass(type(of: self))) unable to commit editing before saving")
        }
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Customize this code block to include application-specific recovery steps.
                let nserror = error as NSError
                NSApplication.shared.presentError(nserror)
            }
        }
    }

    func windowWillReturnUndoManager(window: NSWindow) -> UndoManager? {
        // Returns the NSUndoManager for the application. In this case,
        // the manager returned is that of the managed object context for the application.
        return persistentContainer.viewContext.undoManager
    }

    func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply {
        // Save changes in the application's managed object context before the application terminates.
        let context = persistentContainer.viewContext

        if !context.commitEditing() {
            NSLog("\(NSStringFromClass(type(of: self))) unable to commit editing to terminate")
            return .terminateCancel
        }

        if !context.hasChanges {
            return .terminateNow
        }

        do {
            try context.save()
        } catch {
            let nserror = error as NSError

            // Customize this code block to include application-specific recovery steps.
            let result = sender.presentError(nserror)
            if result {
                return .terminateCancel
            }

            let question =
                NSLocalizedString("Could not save changes while quitting. Quit anyway?",
                                  comment: "Quit without saves error question message")
            let info = NSLocalizedString(
                "Quitting now will lose any changes you have made since the last successful save",
                comment: "Quit without saves error question info")
            let quitButton = NSLocalizedString("Quit anyway", comment: "Quit anyway button title")
            let cancelButton = NSLocalizedString("Cancel", comment: "Cancel button title")
            let alert = NSAlert()
            alert.messageText = question
            alert.informativeText = info
            alert.addButton(withTitle: quitButton)
            alert.addButton(withTitle: cancelButton)

            let answer = alert.runModal()
            if answer == NSApplication.ModalResponse.alertSecondButtonReturn {
                return .terminateCancel
            }
        }
        // If we got here, it is time to quit.
        return .terminateNow
    }

}

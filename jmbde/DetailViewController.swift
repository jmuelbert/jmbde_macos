/**************************************************************************
**
** DetailViewController.swift
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

class DetailViewController: NSViewController {

    /**
      The Description in Top of the actual view
    */
    @IBOutlet weak private var descriptionField: NSTextField!
    /**
      The view Area for the Data Views
    */
    @IBOutlet weak private var viewArea: NSView!

    /**
      The detailItemRecord
        - hold the data from the outline.plist
        - is use for the description header
        - change the seque
    */
    var detailItemRecord: OutlineItem! {
        didSet {
            // Remove the old child view controller
            if !childViewControllers.isEmpty {
                let viewcChild = childViewControllers[0]
                viewcChild.view.isHidden = true
                viewcChild.removeFromParentViewController()
            }

            descriptionField.stringValue = ""

            guard detailItemRecord != nil else { return }

            // Update the description of the area

            descriptionField.stringValue = detailItemRecord.desc

            // Check ist this area actually has an valid controller to display
            guard !detailItemRecord.viewControllerIdentifier.isEmpty else {
                return
            }

            // Load the area storyboard and embed.
            let storyboard: NSStoryboard =
            NSStoryboard(name: NSStoryboard.Name(detailItemRecord.viewControllerIdentifier), bundle: nil)
            _ = NSStoryboard.SceneIdentifier(detailItemRecord.viewControllerIdentifier)
            guard let buttonViewController =
                storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(
                    detailItemRecord.viewControllerIdentifier)) as? NSViewController else { return }

           insertChildViewController(buttonViewController, at: 0)

            buttonViewController.view.translatesAutoresizingMaskIntoConstraints = false

            view.addSubview(buttonViewController.view)

            // Add the propper constraints to the detail view controller
            // so it embeds properly with it's parent view controller.
            let top = NSLayoutConstraint(item: buttonViewController.view,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: viewArea,
                                         attribute: .top,
                                         multiplier: 1,
                                         constant: 0)
            let left = NSLayoutConstraint(item: buttonViewController.view,
                                          attribute: .left,
                                          relatedBy: .equal,
                                          toItem: viewArea,
                                          attribute: .left,
                                          multiplier: 1,
                                          constant: 0)
            let height = NSLayoutConstraint(item: buttonViewController.view,
                                            attribute: .height,
                                            relatedBy: .equal,
                                            toItem: viewArea,
                                            attribute: .height,
                                            multiplier: 1,
                                            constant: 0)
            let width = NSLayoutConstraint(item: buttonViewController.view,
                                           attribute: .width,
                                           relatedBy: .equal,
                                           toItem: viewArea,
                                           attribute: .width,
                                           multiplier: 1,
                                           constant: 0)
            view.addConstraints([top, left, height, width])
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }

}

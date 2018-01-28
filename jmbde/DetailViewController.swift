//
//  DetailViewController.swift
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

class DetailViewController: NSViewController {

    /**
      The Description in Top of the actual view
    */
    @IBOutlet weak var descriptionField: NSTextField!
    /**
      The view Area for the Data Views
    */
    @IBOutlet weak var viewArea: NSView!

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
                let vc = childViewControllers[0]
                vc.view.isHidden = true
                vc.removeFromParentViewController()
            }

            descriptionField.stringValue = ""

            guard detailItemRecord != nil else  { return }

            // Update the description of the area

            descriptionField.stringValue = detailItemRecord.desc

            // Check ist this area actually has an valid controller to display
            guard !detailItemRecord.viewControllerIdentifier.characters.isEmpty else {
                return
            }

            // Load the area storyboard and embed.
            let storyboard: NSStoryboard = NSStoryboard(name: NSStoryboard.Name(rawValue: detailItemRecord.viewControllerIdentifier), bundle: nil)
            // let sceneIdentifier = NSStoryboard.SceneIdentifier(rawValue: detailItemRecord.viewControllerIdentifier)
            guard let buttonViewController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: detailItemRecord.viewControllerIdentifier)) as? NSViewController else { return  }

            insertChildViewController(buttonViewController, at: 0)

            buttonViewController.view.translatesAutoresizingMaskIntoConstraints = false

            view.addSubview(buttonViewController.view)

            // Add the propper constraints to the detail view controller so it embeds properly with it's parent view controller.
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

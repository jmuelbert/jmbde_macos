//
//  OutlineItem.swift
//  jmbde
//
//  Created by Jürgen Mülbert on 18.07.17.
//  Copyright © 2017 Jürgen Mülbert. All rights reserved.
//

import Foundation
import Cocoa

/// The Dataclass for the Sidebar-Menu
class OutlineItem: NSObject {
    let title: String
    let image: String
    let desc: String
    let viewControllerIdentifier: String
    
    /// Constructor for the Menudata
    /// param dictionary
    ///
    init(dictionary: NSDictionary) {
        self.title = dictionary.object(forKey: "title") as! String
        self.image = dictionary.object(forKey: "image") as! String
        self.desc = dictionary.object(forKey: "description") as! String
        self.viewControllerIdentifier = dictionary.object(forKey: "viewControllerIdentifier") as! String

    }
}

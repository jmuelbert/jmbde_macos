//
//  Outine.swift
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

import Foundation
import Cocoa

//
// The Data Class for the Outline View Labels
//
class Outline : NSObject {
    let name: String
    var children = [OutlineItem]()

        //
    // Init the Outline Class
    //
    // @param‚ name
    //
    init(name: String) {
        self.name = name
    }
    
    func isLeaf() -> Bool {
        return true;
    }

    //
    // Init the outline list
    //
    // @param filename The filename with the plist contains the menustruct
    // 
    // @returns Outline The array of the menustruct
    class func outlineList(_ filename: String) -> [Outline]{
        var outlines = [Outline]()
        
        if let outlineList = NSArray(contentsOfFile: filename) as? [NSDictionary] {
            for outlineItems in outlineList {
                let outline = Outline(name: outlineItems.object(forKey: "name") as! String)
                let items = outlineItems.object(forKey: "items") as! [NSDictionary]
                
                for dict in items {
                    let item = OutlineItem(dictionary: dict)
                    outline.children.append(item)
                }
                outlines.append(outline)
            }
        }
        return outlines
    }
}


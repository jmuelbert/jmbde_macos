/**************************************************************************
**  Outine.swift
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
** diese von der Europäischen Kommission genehmigt wurden -
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
import Foundation

/// The Data Class for the Outline View Labels
class Outline: NSObject {
    let name: String
    var children = [OutlineItem]()

    //
    // Init the Outline Class
    //
    // @param name
    //
    init(name: String) {
        self.name = name
    }

    func isLeaf() -> Bool {
        return true
    }

    //
    // Init the outline list
    //
    // @param filename The filename with the plist contains the menustruct
    //
    // @returns Outline The array of the menustruct
    class func outlineList(_ filename: String) -> [Outline] {
        var outlines = [Outline]()

        if let outlineList = NSArray(contentsOfFile: filename) as? [NSDictionary] {
            for outlineItems in outlineList {
                let outline = Outline(name: (outlineItems.object(forKey: "name") as? String)!)
                let items = outlineItems.object(forKey: "items") as? [NSDictionary]

                for dict in items! {
                    let item = OutlineItem(dictionary: dict)
                    outline.children.append(item)
                }
                outlines.append(outline)
            }
        }
        return outlines
    }

}

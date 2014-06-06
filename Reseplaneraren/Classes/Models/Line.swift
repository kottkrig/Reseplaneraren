//
//  Line.swift
//  Reseplaneraren
//
//  Created by Johan Larsson on 2014-06-04.
//  Copyright (c) 2014 Johan Larsson. All rights reserved.
//

import Foundation
import UIKit

class Line {
    let name: String
    let labelName: String?;
    let type: String;
    let direction: String?;
    
    let foregroundColor: UIColor?
    let backgroundColor: UIColor?
    
    let accessibility: String?;
    
    init(attributes: NSDictionary) {
        
        // Västtrafik tycker av någon outgrundlig anledning att den röda färgen
        // i exempelvis femmans spårvagn är förgrundsfärg och vitt är bakgrundsfärgen.
        // Jag håller inte med, därför är dessa färger omvända från hur deras api ser ut.
        
        if let bgColorHexString = attributes["bgColor"] as? String {
            foregroundColor = UIColor.colorWithHexString(bgColorHexString)
        }
        
        if let fgColorHexString = attributes["fgColor"] as? String {
            backgroundColor = UIColor.colorWithHexString(fgColorHexString)
        }
                
        name = attributes.objectForKey("name") as String
        //self.labelName = self.name.stringByTrimmingCharactersInSet(NSCharacterSet.decimalDigitCharacterSet().invertedSet)
        type = attributes.objectForKey("type") as String
        direction = attributes.objectForKey("direction") as? String
    }
}
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
    var labelName: String
    let type: String
    let direction: String?
    
    let foregroundColor: UIColor?
    let backgroundColor: UIColor?
    
    let accessibility: String?
    
    init(attributes: Dictionary<String, AnyObject>) {
        
        // Västtrafik tycker av någon outgrundlig anledning att den röda färgen
        // i exempelvis femmans spårvagn är förgrundsfärg och vitt är bakgrundsfärgen.
        // Jag håller inte med, därför är dessa färger omvända från hur deras api ser ut.
        
        if let bgColorHexString = attributes["bgColor"] as? NSString {
            foregroundColor = UIColor.colorWithHexString(bgColorHexString)
        }
        
        if let fgColorHexString = attributes["fgColor"] as? NSString {
            backgroundColor = UIColor.colorWithHexString(fgColorHexString)
        }
        
        let characterSetWithoutDigits = NSCharacterSet.decimalDigitCharacterSet().invertedSet
        
        name = attributes["name"] as NSString
        labelName = name.stringByTrimmingCharactersInSet(characterSetWithoutDigits)
        type = attributes["type"] as NSString
        direction = attributes["direction"] as? NSString
    }
}
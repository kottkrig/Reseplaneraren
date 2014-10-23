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
    let name: String?
    var labelName: String?
    let type: String?
    let direction: String?
    
    let foregroundColor: UIColor?
    let backgroundColor: UIColor?
    
    let accessibility: String?
    
    init(json: JSON) {
        
        // Västtrafik tycker av någon outgrundlig anledning att den röda färgen
        // i exempelvis femmans spårvagn är förgrundsfärg och vitt är bakgrundsfärgen.
        // Jag håller inte med, därför är dessa färger omvända från hur deras api ser ut.
        
        if let bgColorHexString = json["bgColor"].string {
            foregroundColor = UIColor.colorWithHexString(bgColorHexString)
        }
        
        if let fgColorHexString = json["fgColor"].string {
            backgroundColor = UIColor.colorWithHexString(fgColorHexString)
        }
        
        let characterSetWithoutDigits = NSCharacterSet.decimalDigitCharacterSet().invertedSet
        
        name = json["name"].string
        labelName = name?.stringByTrimmingCharactersInSet(characterSetWithoutDigits)
        type = json["type"].string
        direction = json["direction"].string
    }
}
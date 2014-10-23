//
//  UIColor+Hex.swift
//  Reseplaneraren
//
//  Created by Johan Larsson on 2014-06-06.
//  Copyright (c) 2014 Johan Larsson. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class func colorWithHexString(hexString: String) -> UIColor {
        var cString:String = hexString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = cString.substringFromIndex(cString.startIndex.successor())
        }
        
        if (countElements(cString) != 6) {
            return UIColor.grayColor()
        }
        
        var rString = cString.substringWithRange(Range(start: cString.startIndex, end: advance(cString.startIndex, 2)))
        
        var gString = cString.substringWithRange(Range(start: advance(cString.startIndex, 2), end: advance(cString.startIndex, 4)))
        var bString = cString.substringWithRange(Range(start: advance(cString.startIndex, 4), end: advance(cString.startIndex, 6)))
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        NSScanner(string: rString).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&r)
        NSScanner(string: bString).scanHexInt(&r)
        
        return UIColor()
        //return UIColor(red: Double(r) / 255.0, green: Double(g) / 255.0, blue: Double(b) / 255.0, alpha: Double(1))
    }
}
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
            cString = cString.substringFromIndex(1)
        }
        
        if (countElements(cString) != 6) {
            return UIColor.grayColor()
        }
        
        var rString = cString.substringFromIndex(0).substringToIndex(2)
        var gString = cString.substringFromIndex(2).substringToIndex(4)
        var bString = cString.substringFromIndex(4).substringToIndex(6)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        NSScanner.scannerWithString(rString).scanHexInt(&r)
        NSScanner.scannerWithString(gString).scanHexInt(&g)
        NSScanner.scannerWithString(bString).scanHexInt(&b)
        
        return UIColor()
        //return UIColor(red: Double(r) / 255.0, green: Double(g) / 255.0, blue: Double(b) / 255.0, alpha: Double(1))
    }
}
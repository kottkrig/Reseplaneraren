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
        
        /*if ([attributes objectForKey:@"bgColor"]) {
            NSString *bgString = [[attributes objectForKey:@"bgColor"] stringByReplacingOccurrencesOfString:@"#" withString:@"0x"];
            NSScanner *bgScanner = [NSScanner scannerWithString: bgString];
            unsigned int bgColorInt;
            [bgScanner scanHexInt: &bgColorInt];
            
            _foregroundColor = [UIColor colorWithHex:bgColorInt];
        }
        
        if ([attributes objectForKey:@"fgColor"]) {
            NSString *fgString = [[attributes objectForKey:@"fgColor"] stringByReplacingOccurrencesOfString:@"#" withString:@"0x"];
            NSScanner *fgScanner = [NSScanner scannerWithString: fgString];
            unsigned int fgColorInt;
            [fgScanner scanHexInt: &fgColorInt];
            
            _backgroundColor = [UIColor colorWithHex:fgColorInt];
        }*/
        
        
        self.name = attributes.objectForKey("name") as String
        //self.labelName = self.name.stringByTrimmingCharactersInSet(NSCharacterSet.decimalDigitCharacterSet().invertedSet)
        self.type = attributes.objectForKey("type") as String
        self.direction = attributes.objectForKey("direction") as? String
    }
}
//
//  TripLocation.swift
//  Reseplaneraren
//
//  Created by Johan Larsson on 2014-06-04.
//  Copyright (c) 2014 Johan Larsson. All rights reserved.
//

import Foundation

class TripLocation {
    
    let name: String
    let type: String
    var time: NSDate?
    var rtTime: NSDate?
    let locationId: String
    
    init(attributes: Dictionary<String, AnyObject>) {
                
        name = attributes["name"] as NSString
        type = attributes["type"] as NSString
        locationId = attributes["id"] as NSString
                
        time = DateUtils.createNSDateFromDateString(attributes["date"] as NSString, timeString: attributes["time"] as NSString)
        
        if let rtDateString = attributes["rtDate"] as? NSString {
            rtTime = DateUtils.createNSDateFromDateString(rtDateString, timeString: attributes["rtTime"] as NSString)
        }
    }
}
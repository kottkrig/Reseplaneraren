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
    
    init(attributes: NSDictionary) {
        
        name = attributes["name"] as String
        type = attributes["type"] as String
        locationId = attributes["id"] as String
                
        time = DateUtils.createNSDateFromDateString(attributes["date"] as String, timeString: attributes["time"] as String)
        
        if let rtDateString = attributes["rtDate"] as? String {
            rtTime = DateUtils.createNSDateFromDateString(rtDateString, timeString: attributes["rtTime"] as String)
        }
    }
}
//
//  TripLocation.swift
//  Reseplaneraren
//
//  Created by Johan Larsson on 2014-06-04.
//  Copyright (c) 2014 Johan Larsson. All rights reserved.
//

import Foundation

class TripLocation {
    
    let name: String?
    let type: String?
    var time: NSDate?
    var rtTime: NSDate?
    let locationId: String?
    
    init(json: JSON) {
                
        name = json["name"].string
        type = json["type"].string
        locationId = json["id"].string
        
        if let dateString = json["date"].string {
            if let timeString = json["time"].string {
                time = DateUtils.createNSDateFromDateString(dateString, timeString: timeString)
            }
        }
        
        if let rtDateString = json["rtDate"].string {
            if let rtTimeString = json["rtTime"].string {
                rtTime = DateUtils.createNSDateFromDateString(rtDateString, timeString: rtTimeString)
            }
        }
    }
}
//
//  Trip.swift
//  Reseplaneraren
//
//  Created by Johan Larsson on 2014-06-04.
//  Copyright (c) 2014 Johan Larsson. All rights reserved.
//

import Foundation

class Trip {
    
    var legs: [TripLeg] = []
    let duration: NSDateComponents?
    
    let startTime: NSDate?
    let endTime: NSDate?
    
    init(json: JSON) {
        
        if let legsArray = json["Leg"].array {
            for legAttributes in legsArray {
                legs.append(TripLeg(json: legAttributes))
            }
        } else {
            legs.append(TripLeg(json: json["Leg"]))
        }
                
        startTime = legs[0].origin.time
        endTime = legs[legs.count - 1].destination.time
        
        let unitFlags = NSCalendarUnit.HourCalendarUnit | NSCalendarUnit.MinuteCalendarUnit | NSCalendarUnit.DayCalendarUnit | NSCalendarUnit.MonthCalendarUnit
        
        duration = NSCalendar.currentCalendar().components(unitFlags, fromDate: startTime!, toDate: endTime!, options: NSCalendarOptions.allZeros)
    }
}
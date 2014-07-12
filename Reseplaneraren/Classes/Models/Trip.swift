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
        
        var legsAttributes = json["Leg"]
        
        if let legsArray = json["Leg"]?.array {
            for legAttributes in legsArray {
                legs.append(TripLeg(json: legAttributes))
            }
        } else if let legAttributes = json["Leg"] {
            legs.append(TripLeg(json: legAttributes))
        }
                
        startTime = legs[0].origin.time
        endTime = legs[legs.count - 1].destination.time
    }
}
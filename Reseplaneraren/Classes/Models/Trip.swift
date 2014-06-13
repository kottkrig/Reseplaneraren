//
//  Trip.swift
//  Reseplaneraren
//
//  Created by Johan Larsson on 2014-06-04.
//  Copyright (c) 2014 Johan Larsson. All rights reserved.
//

import Foundation

class Trip {
    
    var legs: TripLeg[] = []
    let duration: NSDateComponents?
    
    let startTime: NSDate?
    let endTime: NSDate?
    
    init(attributes: Dictionary<String, AnyObject>) {
        
        var legsAttributes: AnyObject = attributes["Leg"]!
        
        if let legsArray = legsAttributes as? Dictionary<String, AnyObject>[] {
            for legAttributes in legsArray {
                legs.append(TripLeg(attributes: legAttributes))
            }
        } else if let legAttributes = legsAttributes as? Dictionary<String, AnyObject> {
            legs.append(TripLeg(attributes: legAttributes))
        }
                
        startTime = legs[0].origin.time
        endTime = legs[legs.count - 1].destination.time
    }
}
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
    
    init(attributes: NSDictionary) {
        
        var legsAttributes: AnyObject = attributes["Leg"] as AnyObject
        
        if legsAttributes.isKindOfClass(NSArray) {
            for legAttributes : AnyObject in legsAttributes as NSArray {
                NSLog("%@", legAttributes as NSDictionary)
                legs.append(TripLeg(attributes: legAttributes as NSDictionary))
            }
        } else if legsAttributes.isKindOfClass(NSDictionary) {
            var tripLeg = TripLeg(attributes: legsAttributes as NSDictionary)
            legs.append(tripLeg)
        }
                
        startTime = legs[0].origin.time
        endTime = legs[legs.count - 1].destination.time
    }
}
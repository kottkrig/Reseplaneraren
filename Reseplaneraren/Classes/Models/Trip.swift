//
//  Trip.swift
//  Reseplaneraren
//
//  Created by Johan Larsson on 2014-06-04.
//  Copyright (c) 2014 Johan Larsson. All rights reserved.
//

import Foundation

class Trip {
    
    let legs: TripLeg[]
    let duration: NSDateComponents?
    
    let startTime: NSDate?
    let endTime: NSDate?
    
    init(attributes: NSDictionary) {
        
        var tripLegs: TripLeg[] = []
        
        var legsAttributes : AnyObject = attributes.objectForKey("Leg") as AnyObject
        
        if legsAttributes.isKindOfClass(NSArray) {
            for legAttributes : AnyObject in legsAttributes as NSArray {
                NSLog("%@", legAttributes as NSDictionary)
                tripLegs.append(TripLeg(attributes: legAttributes as NSDictionary))
            }
        } else if (legsAttributes.isKindOfClass(NSDictionary)) {
            tripLegs.append(TripLeg(attributes: legsAttributes as NSDictionary))
        }
        
        self.legs = tripLegs
        
        //startTime = legs[0].origin.time
        //endTime = legs[legs.endIndex].destination.time
    }
}
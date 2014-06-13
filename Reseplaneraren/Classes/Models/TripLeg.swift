//
//  TripLeg.swift
//  Reseplaneraren
//
//  Created by Johan Larsson on 2014-06-04.
//  Copyright (c) 2014 Johan Larsson. All rights reserved.
//

import Foundation

class TripLeg {
    
    let line: Line
    
    let destination: TripLocation
    let origin: TripLocation
    
    init(attributes: Dictionary<String, AnyObject>) {
        self.line = Line(attributes: attributes)
        
        self.destination = TripLocation(attributes: attributes["Destination"] as Dictionary<String, AnyObject>!)
        self.origin = TripLocation(attributes: attributes["Origin"] as Dictionary<String, AnyObject>!)
    }
}

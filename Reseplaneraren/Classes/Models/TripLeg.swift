//
//  TripLeg.swift
//  Reseplaneraren
//
//  Created by Johan Larsson on 2014-06-04.
//  Copyright (c) 2014 Johan Larsson. All rights reserved.
//

import Foundation

class TripLeg {
    
    let line: Line;
    
    let destination: TripLocation;
    let origin: TripLocation;
    
    init(attributes: NSDictionary) {
        self.line = Line(attributes: attributes)
        
        self.destination = TripLocation(attributes: attributes.objectForKey("Destination") as NSDictionary);
        self.origin = TripLocation(attributes: attributes.objectForKey("Origin") as NSDictionary);
    }
}

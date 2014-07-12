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
    
    init(json: JSON) {
        self.line = Line(json: json)
        
        self.destination = TripLocation(json: json["Destination"]!)
        self.origin = TripLocation(json: json["Origin"]!)
    }
}

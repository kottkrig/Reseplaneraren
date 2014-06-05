//
//  TripLocation.swift
//  Reseplaneraren
//
//  Created by Johan Larsson on 2014-06-04.
//  Copyright (c) 2014 Johan Larsson. All rights reserved.
//

import Foundation

class TripLocation: NSObject {
    
    let name: String
    let type: String
    let time: NSDate?
    let rtTime: NSDate?
    //let locationId: String
    
    init(attributes: NSDictionary) {
        
        name = attributes.valueForKeyPath("name") as String
        type = attributes.valueForKeyPath("type") as String
        
        //_time = [DateUtils createNSDateFrom:[attributes valueForKeyPath:@"date"] timeString:[attributes valueForKeyPath:@"time"]];
    }
}
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
        
        name = attributes["name"] as String
        type = attributes["type"] as String
                
        time = DateUtils.createNSDateFromDateString(attributes["date"] as String, timeString: attributes["time"] as String)
    }
}
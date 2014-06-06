//
//  VasttrafikAPIClient.swift
//  Reseplaneraren
//
//  Created by Johan Larsson on 2014-06-06.
//  Copyright (c) 2014 Johan Larsson. All rights reserved.
//

import Foundation

class VasttrafikAPIClient {
    
    class var sharedClient: VasttrafikAPIClient {
        get {
            struct Static {
                static var instance: VasttrafikAPIClient? = nil
                static var token: dispatch_once_t = 0
            }
            
            dispatch_once(&Static.token, { Static.instance = VasttrafikAPIClient() })
            
            return Static.instance!
        }
    }
    
    func fetchTripsWitchSearchParameters(Dictionary success:() -> Trip[], failure:() -> NSError) {
        
    }
    
}
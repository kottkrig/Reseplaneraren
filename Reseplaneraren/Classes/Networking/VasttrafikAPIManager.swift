//
//  VasttrafikAPIManager.swift
//  Reseplaneraren
//
//  Created by Johan Larsson on 2014-06-05.
//  Copyright (c) 2014 Johan Larsson. All rights reserved.
//

import Foundation

class VasttrafikAPIManager {
    
    class var sharedClient: VasttrafikAPIManager {
        get {
            struct Static {
                static var instance: VasttrafikAPIManager? = nil
                static var token: dispatch_once_t = 0
            }
            
            dispatch_once(&Static.token, { Static.instance = VasttrafikAPIManager() })
            
            return Static.instance!
        }
    }
    
    
    
}
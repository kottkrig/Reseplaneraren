//
//  VasttrafikAPIManager.swift
//  Reseplaneraren
//
//  Created by Johan Larsson on 2014-06-05.
//  Copyright (c) 2014 Johan Larsson. All rights reserved.
//

import Foundation

class VasttrafikAPIManager {
    
    let baseUrl = "http://api.vasttrafik.se/bin/rest.exe/"
    
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
    
    func fetchTripsWitchSearchParameters(searchParams: Dictionary<String, String>, success:() -> Trip[], failure:() -> NSError) {
        
        var apiParams = Dictionary<String, String>()
        apiParams["format"] = "json"
        apiParams["authKey"] = VASTTRAFIK_API_KEY
        
        //apiParams + searchParams
        
        var url: NSURL = NSURL.URLWithString("")
        var request = NSURLRequest(URL: url)
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession.sharedSession()
        
        let task: NSURLSessionTask = session.dataTaskWithRequest(request, completionHandler: {(data: NSData!, response: NSURLResponse!, error: NSError!) in
            
            let json: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
            NSLog("%@", json)
        })
        
        task.resume()
    }
    
}
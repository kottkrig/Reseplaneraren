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
    
    func fetchTripsForQuery(tripQuery: TripQuery, success:(Trip[]) -> (), failure:(NSError) -> ()) {
        fetchTripsWitchSearchParameters(tripQuery.queryParameters, success: success, failure: failure)
    }
    
    func fetchTripsWitchSearchParameters(searchParams: Dictionary<String, String>, success:(Trip[]) -> (), failure:(NSError) -> ()) {
        
        var apiParams = Dictionary<String, String>()
        apiParams["format"] = "json"
        apiParams["authKey"] = VASTTRAFIK_API_KEY
        
        for (queryKey, queryValue) in searchParams {
            apiParams[queryKey] = queryValue
        }
        
        var url: NSURL = createUrlStringFromDictionary(baseUrl + "trip", parameters: apiParams)
        var request = NSURLRequest(URL: url)
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession.sharedSession()
        
        let task: NSURLSessionTask = session.dataTaskWithRequest(request, completionHandler: {(data: NSData!, response: NSURLResponse!, error: NSError!) in
            
            let tripJson: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
            
            var tripList: NSDictionary = tripJson["TripList"] as Dictionary<String, AnyObject>
            var tripsAttributes = tripList["Trip"] as Array<Dictionary<String, AnyObject>>
            
            var trips = tripsAttributes.map { dict in Trip(attributes: dict) }
            
            success(trips)
        })
        
        task.resume()
    }
    
    func createUrlStringFromDictionary(baseUrl: String, parameters:Dictionary<String, String>) -> NSURL {
        var paramsString = ""
        
        for (paramKey, paramValue) in parameters {
            paramsString += "\(paramKey)=\(paramValue)&"
        }
        paramsString = paramsString.substringToIndex(countElements(paramsString) - 1)
        return NSURL.URLWithString(baseUrl + "?" + paramsString)
    }
    
    func cancelAllTripRequests() {
        
    }
    
}
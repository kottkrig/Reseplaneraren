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
    
    func fetchTripsForQuery(tripQuery: TripQuery, success:([Trip]) -> (), failure:(NSError) -> ()) {
        fetchTripsWitchSearchParameters(tripQuery.queryParameters, success: success, failure: failure)
    }
    
    func fetchTripsWitchSearchParameters(searchParams: Dictionary<String, String>, success:([Trip]) -> (), failure:(NSError) -> ()) {
        
        var apiParams = Dictionary<String, String>()
        apiParams["format"] = "json"
        apiParams["authKey"] = VASTTRAFIK_API_KEY
        
        for (queryKey, queryValue) in searchParams {
            apiParams[queryKey] = queryValue
        }
        
        var url: NSURL? = createUrlStringFromDictionary(baseUrl + "trip", parameters: apiParams)
        var request = NSURLRequest(URL: url!)
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession.sharedSession()
        
        let task: NSURLSessionTask = session.dataTaskWithRequest(request, completionHandler: {(data: NSData!, response: NSURLResponse!, error: NSError!) in
            
            let dataString = NSString(data: data, encoding: NSUTF8StringEncoding)
            
            var trips: [Trip] = []
            
            if let tripJson = JSON.parse(data).value {
                if let tripsAttributes = tripJson["TripList"]["Trip"].array {
                    for (_, value) in enumerate(tripsAttributes) {
                        trips.append(Trip(json: value))
                    }
                }
            }
            
            success(trips)
        })
        
        task.resume()
    }
    
    func createUrlStringFromDictionary(baseUrl: String, parameters:Dictionary<String, String>) -> NSURL? {
        var paramsString = ""
        
        for (paramKey, paramValue) in parameters {
            paramsString += "\(paramKey)=\(paramValue)&"
        }
        
        paramsString = paramsString.substringToIndex(paramsString.endIndex.predecessor())
        var urlString = baseUrl + "?" + paramsString
        let url = NSURL(string: urlString.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)
        return url
    }
    
    func cancelAllTripRequests() {
        
    }
    
}
//
//  TripQuery.swift
//  Reseplaneraren
//
//  Created by Johan Larsson on 2014-06-06.
//  Copyright (c) 2014 Johan Larsson. All rights reserved.
//

import Foundation
import MapKit

class TripQuery {
    
    var departureDelay: NSTimeInterval {
        didSet {
            prefetchTripsIfPossible()
        }
    }
    
    var trips: [Trip]?
    var queryParameters = Dictionary<String, String>()
    
    init() {
        departureDelay = 0
    }
    
    func prefetchTripsIfPossible() {
        if prefetchIsPossible {
            NSLog("Prefetch is possible")
            fetchTripsWithSuccess({ trips in
                //NSLog("%@", trips)
                })
        }
    }
    
    func fetchTripsWithSuccess(success: (trips: [Trip]) -> ()) {
        
        self.trips = nil
        
        let _departureTime = self.departureTime
        
        queryParameters["time"] = timeFormatter.stringFromDate(_departureTime)
        queryParameters["date"] = dateFormatter.stringFromDate(_departureTime)
        
        VasttrafikAPIManager.sharedClient.cancelAllTripRequests()
        VasttrafikAPIManager.sharedClient.fetchTripsForQuery(self, success: {trips in
                self.trips = trips
                println("Number of trips: \(trips.count)")
                success(trips: trips)
            }, failure: { error in
                NSLog("Error")
            })
    }
    
    var prefetchIsPossible:Bool {
        return hasOrigin && hasDestination
    }
    
    var hasOrigin: Bool {
        return queryParameters["originCoordLat"] != nil || queryParameters["originId"] != nil
    }
    
    var hasDestination: Bool {
        return queryParameters["destCoordLat"] != nil || queryParameters["destId"] != nil
    }
    
    var departureTime: NSDate {
        return NSDate(timeIntervalSinceNow: departureDelay)
    }
    
    var timeFormatter: NSDateFormatter {
        let _timeFormatter = NSDateFormatter()
        _timeFormatter.dateFormat = "HH:mm"
        return _timeFormatter
    }
    
    var dateFormatter: NSDateFormatter {
        let _dateFormatter = NSDateFormatter()
        _dateFormatter.dateFormat = "yyyy-MM-dd"
        return _dateFormatter
    }
    
    
    func setOriginCoordinate(coordinate: CLLocationCoordinate2D) {
        let latString = "\(coordinate.latitude)"
        let longString = "\(coordinate.longitude)"
        
        queryParameters["originCoordLat"] = latString
        queryParameters["originCoordLong"] = longString
        queryParameters["originCoordName"] = "Min Plats"
        
        removeQueryParameters("originId")
        
        prefetchTripsIfPossible()
    }
    
    func setOriginLocationId(locationId: String) {
        queryParameters["originId"] = locationId
        
        removeQueryParameters("originCoordLat", "originCordLong", "originCoordName")
        
        prefetchTripsIfPossible()
    }
    
    func setDestinationLocationId(locationId: String) {
        queryParameters["destId"] = locationId
        
        removeQueryParameters("destCoordLat", "destCordLong", "destCoordName")
        
        prefetchTripsIfPossible()
    }
    
    func removeQueryParameters(queryKeys: String...) {
        queryKeys.map(queryParameters.removeValueForKey)
    }
}
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
    
    var trips: [Trip] = []
    var queryParameters = Dictionary<String, String>()
    
    var isPrefetchPossible: Bool {
    get {
        return true
    }
    }
    
    init() {

    }
    
    func prefetchTripsIfPossible() {
        if isPrefetchPossible {
            NSLog("Prefetch is possible")
            trips = []
            fetchTripsWithSuccess({ trips in
                NSLog("%@", trips)
                })
        }
    }
    
    func fetchTripsWithSuccess(success: (trips: [Trip]) -> ()) {
        
        var newTrips: [Trip] = []
        
        VasttrafikAPIManager.sharedClient.cancelAllTripRequests()
        VasttrafikAPIManager.sharedClient.fetchTripsForQuery(self, success: {trips in
                self.trips = trips
                println("Number of trips: \(self.trips.count)")
                success(trips: newTrips)
            }, failure: { error in
                NSLog("Error")
            })
        
        
    }
    
    
    func setOriginCoordinate(coordinate: CLLocationCoordinate2D) {
        let latString = "\(coordinate.latitude)"
        let longString = "\(coordinate.longitude)"
        
        queryParameters["originCoordLat"] = latString
        queryParameters["originCoordLong"] = longString
        queryParameters["originCoordName"] = "Min Plats"
        
        removeQueryParameters("originId")
    }
    
    func setOriginLocationId(locationId: String) {
        queryParameters["originId"] = locationId
        
        removeQueryParameters("originCoordLat", "originCordLong", "originCoordName")
    }
    
    func setDestinationLocationId(locationId: String) {
        queryParameters["destId"] = locationId
        
        removeQueryParameters("destCoordLat", "destCordLong", "destCoordName")
    }
    
    func removeQueryParameters(queryKeys: String...) {
        queryKeys.map(queryParameters.removeValueForKey)
    }
}
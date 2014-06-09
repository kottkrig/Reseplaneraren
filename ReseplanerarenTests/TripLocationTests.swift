//
//  ReseplanerarenTests.swift
//  ReseplanerarenTests
//
//  Created by Johan Larsson on 2014-06-04.
//  Copyright (c) 2014 Johan Larsson. All rights reserved.
//

import XCTest
import Reseplaneraren

class TripLocationTests: XCTestCase {
    
    var tripLocation: TripLocation?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        var tripLocationString = "{\"$\": \"\", \"date\": \"2014-06-09\",\"id\": \"9022014005485003\",\"name\": \"Rosenlund, Göteborg\",\"routeIdx\": \"1\",\"rtDate\": \"2014-06-09\",\"rtTime\": \"19:00\",\"time\": \"19:00\",\"track\": \"C\",\"type\": \"ST\"}"
        var tripLocationJson = convertStringToJsonDictionary(tripLocationString)
        tripLocation = TripLocation(attributes: tripLocationJson)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTime() {
        XCTAssert(tripLocation!.time.description == "2014-06-09 17:00:00 +0000", "Time should be parsed")
    }
    
    func testRealtime() {
        XCTAssert(tripLocation!.rtTime.description == "2014-06-09 17:00:00 +0000", "Realtime should be parsed")
    }
    
    func testName() {
        XCTAssert(tripLocation!.name == "Rosenlund, Göteborg", "Name should be parsed")
    }
    
    func testLocationId() {
        XCTAssert(tripLocation!.locationId == "9022014005485003")
    }
    
    func convertStringToJsonDictionary(string: String) -> NSDictionary {
        return NSJSONSerialization.JSONObjectWithData(string.dataUsingEncoding(NSUTF8StringEncoding), options: NSJSONReadingOptions.MutableContainers, error:nil) as NSDictionary
    }
    
}

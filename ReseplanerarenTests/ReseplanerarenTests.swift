//
//  ReseplanerarenTests.swift
//  ReseplanerarenTests
//
//  Created by Johan Larsson on 2014-06-04.
//  Copyright (c) 2014 Johan Larsson. All rights reserved.
//

import XCTest
import Reseplaneraren

class ReseplanerarenTests: XCTestCase {
    
    var tripJson = NSDictionary()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        var tripJsonString = "{\n\"TripList\":{\n  \"noNamespaceSchemaLocation\":\"http://api.vasttrafik.se/v1/hafasRestTrip.xsd\",\n  \"servertime\":\"19:50\",\n  \"serverdate\":\"2013-08-13\",\n  \"Trip\":[{\n    \"Leg\":{\n      \"name\":\"285 ÄLVSNABBEN\",\n      \"type\":\"BOAT\",\n      \"id\":\"9015014528500053\",\n      \"direction\":\"Lilla Bommen via Rosenlund\",\n      \"fgColor\":\"#00A5DC\",\n      \"bgColor\":\"#ffffff\",\n      \"stroke\":\"Solid\",\n      \"Origin\":{\n        \"name\":\"Lindholmspiren, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014004493001\",\n        \"routeIdx\":\"3\",\n        \"time\":\"20:15\",\n        \"date\":\"2013-08-13\",\n        \"track\":\"A \",\n        \"rtTime\":\"20:15\",\n        \"rtDate\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"Destination\":{\n        \"name\":\"Rosenlund, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014005485003\",\n        \"routeIdx\":\"4\",\n        \"time\":\"20:19\",\n        \"date\":\"2013-08-13\",\n        \"track\":\"C \",\n        \"rtTime\":\"20:19\",\n        \"rtDate\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"JourneyDetailRef\":{\n        \"ref\":\"http://api.vasttrafik.se/bin/rest.exe/v1/journeyDetail?ref=21942%2F10358%2F129016%2F57194%2F80%3Fdate%3D2013-08-13%26station_evaId%3D4493001%26station_type%3Ddep%26authKey%3Db6345eeb-8ce8-4ffd-a6d2-15978fd4fc6d%26format%3Djson%26\"\n        }\n      }\n    },{\n    \"Leg\":[{\n      \"name\":\"Gå\",\n      \"type\":\"WALK\",\n      \"Origin\":{\n        \"name\":\"Lindholmspiren, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014004493001\",\n        \"time\":\"20:24\",\n        \"date\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"Destination\":{\n        \"name\":\"Lindholmen, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014004490002\",\n        \"time\":\"20:31\",\n        \"date\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        }\n      },{\n      \"name\":\"Buss 31\",\n      \"type\":\"BUS\",\n      \"id\":\"9015014503100061\",\n      \"direction\":\"Hjalmar Brantingsplatsen\",\n      \"fgColor\":\"#00A5DC\",\n      \"bgColor\":\"#ffffff\",\n      \"stroke\":\"Solid\",\n      \"Origin\":{\n        \"name\":\"Lindholmen, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014004490002\",\n        \"routeIdx\":\"21\",\n        \"time\":\"20:31\",\n        \"date\":\"2013-08-13\",\n        \"track\":\"B \",\n        \"rtTime\":\"20:31\",\n        \"rtDate\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"Destination\":{\n        \"name\":\"Hjalmar Brantingsplatsen, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014003180003\",\n        \"routeIdx\":\"25\",\n        \"time\":\"20:38\",\n        \"date\":\"2013-08-13\",\n        \"track\":\"C \",\n        \"rtTime\":\"20:38\",\n        \"rtDate\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"JourneyDetailRef\":{\n        \"ref\":\"http://api.vasttrafik.se/bin/rest.exe/v1/journeyDetail?ref=555846%2F205579%2F778344%2F203890%2F80%3Fdate%3D2013-08-13%26station_evaId%3D4490002%26station_type%3Ddep%26authKey%3Db6345eeb-8ce8-4ffd-a6d2-15978fd4fc6d%26format%3Djson%26\"\n        }\n      },{\n      \"name\":\"Gå\",\n      \"type\":\"WALK\",\n      \"Origin\":{\n        \"name\":\"Hjalmar Brantingsplatsen, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014003180003\",\n        \"time\":\"20:43\",\n        \"date\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"Destination\":{\n        \"name\":\"Hjalmar Brantingsplatsen, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014003180007\",\n        \"time\":\"20:43\",\n        \"date\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        }\n      },{\n      \"name\":\"Buss 52\",\n      \"type\":\"BUS\",\n      \"id\":\"9015014505200123\",\n      \"direction\":\"Linnéplatsen\",\n      \"fgColor\":\"#00b6f1\",\n      \"bgColor\":\"#c0dc39\",\n      \"stroke\":\"Solid\",\n      \"Origin\":{\n        \"name\":\"Hjalmar Brantingsplatsen, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014003180007\",\n        \"routeIdx\":\"13\",\n        \"time\":\"20:46\",\n        \"date\":\"2013-08-13\",\n        \"track\":\"G \",\n        \"rtTime\":\"20:46\",\n        \"rtDate\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"Destination\":{\n        \"name\":\"Lilla Bommen, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014004380001\",\n        \"routeIdx\":\"14\",\n        \"time\":\"20:50\",\n        \"date\":\"2013-08-13\",\n        \"track\":\"A \",\n        \"rtTime\":\"20:50\",\n        \"rtDate\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"JourneyDetailRef\":{\n        \"ref\":\"http://api.vasttrafik.se/bin/rest.exe/v1/journeyDetail?ref=553347%2F207187%2F33284%2F167809%2F80%3Fdate%3D2013-08-13%26station_evaId%3D3180007%26station_type%3Ddep%26authKey%3Db6345eeb-8ce8-4ffd-a6d2-15978fd4fc6d%26format%3Djson%26\"\n        }\n      },{\n      \"name\":\"Gå\",\n      \"type\":\"WALK\",\n      \"Origin\":{\n        \"name\":\"Lilla Bommen, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014004380001\",\n        \"time\":\"20:55\",\n        \"date\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"Destination\":{\n        \"name\":\"Lilla Bommen, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014004380004\",\n        \"time\":\"20:55\",\n        \"date\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        }\n      },{\n      \"name\":\"RÖD EXPRESS\",\n      \"type\":\"BUS\",\n      \"id\":\"9015014620100169\",\n      \"direction\":\"Lilla Varholmen\",\n      \"fgColor\":\"#cd1432\",\n      \"bgColor\":\"#ffffff\",\n      \"stroke\":\"Solid\",\n      \"Origin\":{\n        \"name\":\"Lilla Bommen, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014004380004\",\n        \"routeIdx\":\"11\",\n        \"time\":\"20:56\",\n        \"date\":\"2013-08-13\",\n        \"track\":\"D \",\n        \"rtTime\":\"20:56\",\n        \"rtDate\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"Destination\":{\n        \"name\":\"Rosenlund, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014005485002\",\n        \"routeIdx\":\"13\",\n        \"time\":\"20:59\",\n        \"date\":\"2013-08-13\",\n        \"track\":\"B \",\n        \"rtTime\":\"20:59\",\n        \"rtDate\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"JourneyDetailRef\":{\n        \"ref\":\"http://api.vasttrafik.se/bin/rest.exe/v1/journeyDetail?ref=16605%2F18234%2F174806%2F81870%2F80%3Fdate%3D2013-08-13%26station_evaId%3D4380004%26station_type%3Ddep%26authKey%3Db6345eeb-8ce8-4ffd-a6d2-15978fd4fc6d%26format%3Djson%26\"\n        }\n      }]\n    },{\n    \"Leg\":[{\n      \"name\":\"Gå\",\n      \"type\":\"WALK\",\n      \"Origin\":{\n        \"name\":\"Lindholmspiren, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014004493001\",\n        \"time\":\"20:34\",\n        \"date\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"Destination\":{\n        \"name\":\"Lindholmen, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014004490001\",\n        \"time\":\"20:41\",\n        \"date\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        }\n      },{\n      \"name\":\"Buss 16\",\n      \"type\":\"BUS\",\n      \"id\":\"9015014501600125\",\n      \"direction\":\"Högsbohöjd\",\n      \"fgColor\":\"#00b6f1\",\n      \"bgColor\":\"#c0dc39\",\n      \"stroke\":\"Solid\",\n      \"accessibility\":\"wheelChair\",\n      \"Origin\":{\n        \"name\":\"Lindholmen, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014004490001\",\n        \"routeIdx\":\"8\",\n        \"time\":\"20:41\",\n        \"date\":\"2013-08-13\",\n        \"track\":\"A \",\n        \"rtTime\":\"20:41\",\n        \"rtDate\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"Destination\":{\n        \"name\":\"Brunnsparken, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014001760005\",\n        \"routeIdx\":\"12\",\n        \"time\":\"20:50\",\n        \"date\":\"2013-08-13\",\n        \"track\":\"E \",\n        \"rtTime\":\"20:50\",\n        \"rtDate\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"JourneyDetailRef\":{\n        \"ref\":\"http://api.vasttrafik.se/bin/rest.exe/v1/journeyDetail?ref=821520%2F286692%2F299120%2F124282%2F80%3Fdate%3D2013-08-13%26station_evaId%3D4490001%26station_type%3Ddep%26authKey%3Db6345eeb-8ce8-4ffd-a6d2-15978fd4fc6d%26format%3Djson%26\"\n        }\n      },{\n      \"name\":\"Gå\",\n      \"type\":\"WALK\",\n      \"Origin\":{\n        \"name\":\"Brunnsparken, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014001760005\",\n        \"time\":\"20:55\",\n        \"date\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"Destination\":{\n        \"name\":\"Brunnsparken, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014001760003\",\n        \"time\":\"20:55\",\n        \"date\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        }\n      },{\n      \"name\":\"Buss 60\",\n      \"type\":\"BUS\",\n      \"id\":\"9015014506000263\",\n      \"direction\":\"Masthugget\",\n      \"fgColor\":\"#00b6f1\",\n      \"bgColor\":\"#c0dc39\",\n      \"stroke\":\"Solid\",\n      \"accessibility\":\"wheelChair\",\n      \"Origin\":{\n        \"name\":\"Brunnsparken, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014001760003\",\n        \"routeIdx\":\"12\",\n        \"time\":\"21:01\",\n        \"date\":\"2013-08-13\",\n        \"track\":\"C \",\n        \"rtTime\":\"21:01\",\n        \"rtDate\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"Destination\":{\n        \"name\":\"Rosenlund, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014005485002\",\n        \"routeIdx\":\"14\",\n        \"time\":\"21:06\",\n        \"date\":\"2013-08-13\",\n        \"track\":\"B \",\n        \"rtTime\":\"21:06\",\n        \"rtDate\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"JourneyDetailRef\":{\n        \"ref\":\"http://api.vasttrafik.se/bin/rest.exe/v1/journeyDetail?ref=812538%2F279416%2F176618%2F182540%2F80%3Fdate%3D2013-08-13%26station_evaId%3D1760003%26station_type%3Ddep%26authKey%3Db6345eeb-8ce8-4ffd-a6d2-15978fd4fc6d%26format%3Djson%26\"\n        }\n      }]\n    },{\n    \"Leg\":{\n      \"name\":\"285 ÄLVSNABBEN\",\n      \"type\":\"BOAT\",\n      \"id\":\"9015014528500055\",\n      \"direction\":\"Lilla Bommen via Rosenlund\",\n      \"fgColor\":\"#00A5DC\",\n      \"bgColor\":\"#ffffff\",\n      \"stroke\":\"Solid\",\n      \"Origin\":{\n        \"name\":\"Lindholmspiren, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014004493001\",\n        \"routeIdx\":\"3\",\n        \"time\":\"21:15\",\n        \"date\":\"2013-08-13\",\n        \"track\":\"A \",\n        \"rtTime\":\"21:15\",\n        \"rtDate\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"Destination\":{\n        \"name\":\"Rosenlund, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014005485003\",\n        \"routeIdx\":\"4\",\n        \"time\":\"21:19\",\n        \"date\":\"2013-08-13\",\n        \"track\":\"C \",\n        \"rtTime\":\"21:19\",\n        \"rtDate\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"JourneyDetailRef\":{\n        \"ref\":\"http://api.vasttrafik.se/bin/rest.exe/v1/journeyDetail?ref=945435%2F318189%2F344052%2F143120%2F80%3Fdate%3D2013-08-13%26station_evaId%3D4493001%26station_type%3Ddep%26authKey%3Db6345eeb-8ce8-4ffd-a6d2-15978fd4fc6d%26format%3Djson%26\"\n        }\n      }\n    },{\n    \"Leg\":[{\n      \"name\":\"Gå\",\n      \"type\":\"WALK\",\n      \"Origin\":{\n        \"name\":\"Lindholmspiren, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014004493001\",\n        \"time\":\"21:24\",\n        \"date\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"Destination\":{\n        \"name\":\"Lindholmen, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014004490002\",\n        \"time\":\"21:31\",\n        \"date\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        }\n      },{\n      \"name\":\"Buss 31\",\n      \"type\":\"BUS\",\n      \"id\":\"9015014503100065\",\n      \"direction\":\"Hjalmar Brantingsplatsen\",\n      \"fgColor\":\"#00A5DC\",\n      \"bgColor\":\"#ffffff\",\n      \"stroke\":\"Solid\",\n      \"Origin\":{\n        \"name\":\"Lindholmen, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014004490002\",\n        \"routeIdx\":\"21\",\n        \"time\":\"21:31\",\n        \"date\":\"2013-08-13\",\n        \"track\":\"B \",\n        \"rtTime\":\"21:31\",\n        \"rtDate\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"Destination\":{\n        \"name\":\"Hjalmar Brantingsplatsen, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014003180003\",\n        \"routeIdx\":\"25\",\n        \"time\":\"21:38\",\n        \"date\":\"2013-08-13\",\n        \"track\":\"C \",\n        \"rtTime\":\"21:38\",\n        \"rtDate\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"JourneyDetailRef\":{\n        \"ref\":\"http://api.vasttrafik.se/bin/rest.exe/v1/journeyDetail?ref=141843%2F67578%2F418066%2F161754%2F80%3Fdate%3D2013-08-13%26station_evaId%3D4490002%26station_type%3Ddep%26authKey%3Db6345eeb-8ce8-4ffd-a6d2-15978fd4fc6d%26format%3Djson%26\"\n        }\n      },{\n      \"name\":\"Gå\",\n      \"type\":\"WALK\",\n      \"Origin\":{\n        \"name\":\"Hjalmar Brantingsplatsen, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014003180003\",\n        \"time\":\"21:43\",\n        \"date\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"Destination\":{\n        \"name\":\"Hjalmar Brantingsplatsen, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014003180007\",\n        \"time\":\"21:43\",\n        \"date\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        }\n      },{\n      \"name\":\"Buss 52\",\n      \"type\":\"BUS\",\n      \"id\":\"9015014505200131\",\n      \"direction\":\"Linnéplatsen\",\n      \"fgColor\":\"#00b6f1\",\n      \"bgColor\":\"#c0dc39\",\n      \"stroke\":\"Solid\",\n      \"Origin\":{\n        \"name\":\"Hjalmar Brantingsplatsen, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014003180007\",\n        \"routeIdx\":\"13\",\n        \"time\":\"21:46\",\n        \"date\":\"2013-08-13\",\n        \"track\":\"G \",\n        \"rtTime\":\"21:46\",\n        \"rtDate\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"Destination\":{\n        \"name\":\"Lilla Bommen, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014004380001\",\n        \"routeIdx\":\"14\",\n        \"time\":\"21:50\",\n        \"date\":\"2013-08-13\",\n        \"track\":\"A \",\n        \"rtTime\":\"21:50\",\n        \"rtDate\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"JourneyDetailRef\":{\n        \"ref\":\"http://api.vasttrafik.se/bin/rest.exe/v1/journeyDetail?ref=554046%2F207420%2F721818%2F176233%2F80%3Fdate%3D2013-08-13%26station_evaId%3D3180007%26station_type%3Ddep%26authKey%3Db6345eeb-8ce8-4ffd-a6d2-15978fd4fc6d%26format%3Djson%26\"\n        }\n      },{\n      \"name\":\"Gå\",\n      \"type\":\"WALK\",\n      \"Origin\":{\n        \"name\":\"Lilla Bommen, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014004380001\",\n        \"time\":\"21:55\",\n        \"date\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"Destination\":{\n        \"name\":\"Lilla Bommen, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014004380004\",\n        \"time\":\"21:55\",\n        \"date\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        }\n      },{\n      \"name\":\"RÖD EXPRESS\",\n      \"type\":\"BUS\",\n      \"id\":\"9015014620100173\",\n      \"direction\":\"Lilla Varholmen\",\n      \"fgColor\":\"#cd1432\",\n      \"bgColor\":\"#ffffff\",\n      \"stroke\":\"Solid\",\n      \"accessibility\":\"wheelChair\",\n      \"Origin\":{\n        \"name\":\"Lilla Bommen, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014004380004\",\n        \"routeIdx\":\"11\",\n        \"time\":\"21:56\",\n        \"date\":\"2013-08-13\",\n        \"track\":\"D \",\n        \"rtTime\":\"21:56\",\n        \"rtDate\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"Destination\":{\n        \"name\":\"Rosenlund, Göteborg\",\n        \"type\":\"ST\",\n        \"id\":\"9022014005485002\",\n        \"routeIdx\":\"13\",\n        \"time\":\"21:59\",\n        \"date\":\"2013-08-13\",\n        \"track\":\"B \",\n        \"rtTime\":\"21:59\",\n        \"rtDate\":\"2013-08-13\",\n        \"$\":\"\\n\"\n        },\n      \"JourneyDetailRef\":{\n        \"ref\":\"http://api.vasttrafik.se/bin/rest.exe/v1/journeyDetail?ref=517245%2F185114%2F344328%2F255%2F80%3Fdate%3D2013-08-13%26station_evaId%3D4380004%26station_type%3Ddep%26authKey%3Db6345eeb-8ce8-4ffd-a6d2-15978fd4fc6d%26format%3Djson%26\"\n        }\n      }]\n    }]\n  }\n}";
        
        
        
        var jsonData = tripJsonString.dataUsingEncoding(NSUTF8StringEncoding)
        
        self.tripJson = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers, error:nil) as NSDictionary
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAllTripsAreParsed() {
        var trips: Trip[] = []

        var tripList: NSDictionary = tripJson["TripList"] as NSDictionary
        var tripsAttributes: NSArray = tripList.objectForKey("Trip") as NSArray
        
        for tripAttributes : AnyObject in tripsAttributes {
            trips.append(Trip(attributes: tripAttributes as NSDictionary))
        }
        
        XCTAssert(trips[0].legs[0].line.labelName == "285", "First trip line should be Älvsnabben 285")
        XCTAssert(trips.count == 5, "There should be 5 trips in json data")
    }
    
    func testLabelName() {
        var trips: Trip[] = []
        
        var tripList: NSDictionary = tripJson["TripList"] as NSDictionary
        var tripsAttributes: NSArray = tripList.objectForKey("Trip") as NSArray
        
        for tripAttributes : AnyObject in tripsAttributes {
            trips.append(Trip(attributes: tripAttributes as NSDictionary))
        }
        
        XCTAssert(trips[0].legs[0].line.labelName == "285", "First trip line should be Älvsnabben 285")
    }
    
    func testTripLegsAreParsed() {
        var trips: Trip[] = []
        
        var tripList: NSDictionary = tripJson["TripList"] as NSDictionary
        var tripsAttributes: NSArray = tripList["Trip"] as NSArray
        
        for tripAttributes: AnyObject in tripsAttributes {
            trips.append(Trip(attributes: tripAttributes as NSDictionary))
        }
        
        let trip = trips[0]
        let leg = trip.legs[0]
        
        var destinationName: String = leg.destination.name
        
        XCTAssertTrue(destinationName == "Rosenlund, Göteborg", "Location should be Rosenlund")
    }
    
}

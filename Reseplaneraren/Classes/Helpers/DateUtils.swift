//
//  DateUtils.swift
//  Reseplaneraren
//
//  Created by Johan Larsson on 2014-06-06.
//  Copyright (c) 2014 Johan Larsson. All rights reserved.
//

import Foundation

class DateUtils {
    class func createNSDateFromDateString(dateString: String, timeString: String) -> NSDate? {
        let dateTimeString = dateString + " " + timeString
        
        var formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter.dateFromString(dateTimeString)
    }
}
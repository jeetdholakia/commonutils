//
//  TimestampUtils.swift
//  100M_India_Community-iOS
//
//  Created by Jeet Dholakia on 7/4/19.
//  Copyright © 2019 Dhruv. All rights reserved.
//

import Foundation

class TimestampUtils: NSObject {
    
    class func convertStringDateFromFormat(_ inputFormat:String, toFormat outputFormat:String, fromString dateString:String)->String{
        
        let usLocale: Locale = Locale(identifier: "en_US")
        
        var dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.locale = usLocale
        dateFormatter.dateFormat = inputFormat
        
        dateFormatter = DateFormatter()
        let date: Date = dateFormatter.date(from: dateString)!
        
        dateFormatter.locale = usLocale
        dateFormatter.dateFormat = outputFormat
        
        let resultedDateString: String = dateFormatter.string(from: date)
        
        return resultedDateString
    }
    
    class func getTimeStampForCurrentTime()->String{
        let timestampNumber: NSNumber = NSNumber(value: (Date().timeIntervalSince1970) * 1000 as Double)
        return timestampNumber.stringValue
    }
    
    class func getTimeStampFromDate(_ iDate: Date) -> String {
        let timestamp: String = String(iDate.timeIntervalSince1970)
        return timestamp
    }
    
    class func getCurrentTimeStampInGMTFormat() -> String {
        return TimestampUtils.getTimeStampFromDate(DateUtils.convertDateToGlobalTime(Date()))
    }
    
}

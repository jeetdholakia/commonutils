//
//  MyDateUtils.swift
//  Common Utilities
//
//  Created by Jeet Dholakia on 7/22/19.
//  Copyright © 2019 Jeet Dholakia. All rights reserved.
//

import Foundation

class MyDateUtils: NSObject {
    static func getBirthDateFormatFromYYYYMMDD(date: String) throws -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd MMM yyyy"
        let finalDate = dateFormatter.string(from: date!)
        let dateSplitted = finalDate.split(separator: " ")
        let dayNumber = Int(dateSplitted[0])
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        let finalDayNumber = formatter.string(from: dayNumber! as NSNumber)!
        let finalReturnString = finalDayNumber + " " + dateSplitted[1] + " " + dateSplitted[2]
        return  finalReturnString
    }
    
    static func getStringDateFromDate(date: Date) throws -> String {
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        let myString = formatter.string(from: date) // string purpose I add here
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "dd/mm/yyyy"
        // again convert your date to string
        let fullDateString = formatter.string(from: yourDate!)
        let endIndex = fullDateString.index(fullDateString.endIndex, offsetBy: -6)
        let truncated = String(fullDateString[..<endIndex])
        return truncated
    }
    
    static func convertDateFormater(_ date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return  dateFormatter.string(from: date!)
    }
    
    static func convertDateToLocalTime(_ iDate: Date) -> Date {
        let timeZone: TimeZone = TimeZone.autoupdatingCurrent
        let seconds: Int = timeZone.secondsFromGMT(for: iDate)
        return Date(timeInterval: TimeInterval(seconds), since: iDate)
    }
    
    static func convertDateToGlobalTime(_ iDate: Date) -> Date {
        let timeZone: TimeZone = TimeZone.autoupdatingCurrent
        let seconds: Int = -timeZone.secondsFromGMT(for: iDate)
        return Date(timeInterval: TimeInterval(seconds), since: iDate)
    }
    
    static func getCurrentDateInFormat(_ format: String) -> String{
        
        let usLocale: Locale = Locale(identifier: "en_US")
        
        let timeFormatter: DateFormatter = DateFormatter()
        timeFormatter.dateFormat = format
        
        timeFormatter.timeZone = TimeZone.autoupdatingCurrent
        timeFormatter.locale = usLocale
        
        let date: Date = Date()
        let stringFromDate: String = timeFormatter.string(from: date)
        
        return stringFromDate
    }
    
    static func getDate(_ date: Date, inFormat format: String) -> String {
        
        let usLocale: Locale = Locale(identifier: "en_US")
        let timeFormatter: DateFormatter = DateFormatter()
        
        timeFormatter.dateFormat = format
        timeFormatter.timeZone = TimeZone.autoupdatingCurrent
        
        timeFormatter.locale = usLocale
        
        let stringFromDate: String = timeFormatter.string(from: date)
        
        return stringFromDate
    }
    
    static func UTCToLocal(date:String) -> String {
        let dateFormatter = DateFormatter()
        
        let locale = NSLocale.current
        let formatter : String = DateFormatter.dateFormat(fromTemplate: "j", options:0, locale:locale)!
        if formatter.contains("a") {
            dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        } else {
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        }
        
        //dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let dt = dateFormatter.date(from: date)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = .current
        
        if dateFormatter.locale.regionCode == "GB" {
            dateFormatter.timeZone = TimeZone(identifier:"Europe")
        }
        //print(dt as Any)
        if formatter.contains("a") {
            dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        } else {
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        }
        
        if dt == nil {
            return "2019-05-14 06:14:58 UTC"
        }
        else {
            
            return dateFormatter.string(from: dt!)
        }
    }
    
    static func toDatefromString (dateString : String) -> Date? {
        // let dateString = self.chatFlightModel.data?.flights![0].departureDatetime!
        let dateFormatter = DateFormatter()
        let locale = NSLocale.current
        let formatter : String = DateFormatter.dateFormat(fromTemplate: "j", options:0, locale:locale)!
        if formatter.contains("a") {
            dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        } else {
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        }
        //let locale = NSTimeZone.init(abbreviation: "UTC+5.30")
        //dateFormatter.timeZone = locale! as TimeZone
        //NSTimeZone.default = locale! as TimeZone
        //dateFormatter.locale = Locale(identifier:"en-IN")
        //dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = .current
        
        if dateFormatter.locale.regionCode == "GB" {
            dateFormatter.timeZone = TimeZone(identifier:"Europe")
        }
        
        if formatter.contains("a") {
            dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        } else {
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        }
        let dateObj = dateFormatter.date(from: dateString)
        return dateObj
        
    }
    
    static func getDateFromTimeStamp(timeStamp : Double , strFormat: String) -> String {
        let date = NSDate(timeIntervalSince1970: timeStamp)
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = strFormat
        dayTimePeriodFormatter.timeZone = .current
        dayTimePeriodFormatter.locale = .current
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
    }
    
    static func convertStringToDate(strDateFormat: String, dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = strDateFormat
        dateFormatter.timeZone = .current
        dateFormatter.locale = .current
        let serverDate: Date = dateFormatter.date(from: dateString)!
        return serverDate
    }
    
    static func getStringFromDate(date : Date , strFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = .current
        formatter.locale = .current
        let myString = formatter.string(from: date)
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = strFormat
        return formatter.string(from: yourDate!)
        
    }
    
    static func convertDateFromDate(_datePassed: String, format: String) -> String {
        let dateFormatter = DateFormatter()
        let locale = NSLocale.current
        let formatter : String = DateFormatter.dateFormat(fromTemplate: "j", options:0, locale:locale)!
        if formatter.contains("a") {
            dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        } else {
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        }
        dateFormatter.locale = .current
        
        //print( dateFormatter.locale)
        //print(dateFormatter.locale.regionCode)
        
        //print(dateFormatter.timeZone.abbreviation())
        
        if dateFormatter.locale.regionCode == "GB" {
            dateFormatter.timeZone = TimeZone(identifier:"Europe")
        }
        
        
        var myDate = dateFormatter.date(from: _datePassed)
        
        if myDate == nil {
            
            myDate = Date()
        }
        
        let calendar = Calendar.current
        
        if  calendar.isDateInYesterday(myDate!) == true {
            return "Yesterday"
        }
        
        if calendar.isDateInToday(myDate!) == true {
            return "Today"
        }
        
        if calendar.isDateInTomorrow(myDate!) == true {
            return "Tomorrow"
        }
        else
        {
            dateFormatter.dateFormat = format
            return dateFormatter.string(from: myDate!)
        }
    }
}

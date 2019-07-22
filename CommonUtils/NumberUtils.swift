//
//  NumberUtils.swift
//  100M_India_Community-iOS
//
//  Created by Jeet Dholakia on 7/4/19.
//  Copyright © 2019 Dhruv. All rights reserved.
//

import Foundation

open class NumberUtils: NSObject {
    //MARK:- Number formatter function
    static func getCommaFormattedNumber(number: String) -> String {
        guard let priceInt = Int(number) else { return "0" }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        return numberFormatter.string(from: NSNumber(value:priceInt)) ?? "0"
    }
    
    static func getCommaFormattedNumberWithoutCurrencySymbol(number: String) -> String {
        guard let priceInt = Int(number) else { return "0" }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value:priceInt)) ?? "0"
    }
    
    static func getCommaFormattedNumberWithFloat(number: String) -> String {
        let currencyNumber = number.split(separator: ".")
        let firstCurrencyString = currencyNumber[0]
        guard let priceInt = Int(firstCurrencyString) else { return "0" }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        let returnString = numberFormatter.string(from: NSNumber(value:priceInt))! + "." + currencyNumber[1]
        return returnString
    }
}

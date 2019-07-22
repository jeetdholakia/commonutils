//
//  StringUtils.swift
//  100M_India_Community-iOS
//
//  Created by Jeet Dholakia on 6/27/19.
//  Copyright © 2019 Dhruv. All rights reserved.
//

import Foundation

open class StringUtils: NSObject {
    static func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
}

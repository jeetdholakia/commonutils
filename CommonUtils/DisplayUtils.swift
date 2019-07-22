//
//  DisplayUtils.swift
//  100M_India_Community-iOS
//
//  Created by Jeet Dholakia on 7/4/19.
//  Copyright © 2019 Dhruv. All rights reserved.
//

import Foundation

class DisplayUtils: NSObject {
    
    static func getScreenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // Screen height.
    static func getScreenHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
}

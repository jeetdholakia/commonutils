//
//  DocumentUtils.swift
//  100M_India_Community-iOS
//
//  Created by Jeet Dholakia on 7/4/19.
//  Copyright © 2019 Dhruv. All rights reserved.
//

import Foundation

open class DocumentUtils: NSObject {
    class func getDocumentDirectoryPath() -> String {
        let arrPaths : NSArray = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        return arrPaths[0] as! String
    }
    
    class func stringByPathComponet(fileName : String , Path : String) -> String {
        var tmpPath : NSString = Path as NSString
        tmpPath = tmpPath.appendingPathComponent(fileName) as NSString
        return tmpPath as String
    }
}

//
//  Data.swift
//  Sample
//
//  Created by Yaroslav Sharafutdinov on 8/9/17.
//  Copyright © 2017 Sample. All rights reserved.
//

import Foundation
import ObjectMapper

class Data<T : Mappable> : Mappable {
    var data: T!
    var status: Int!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["data"]
        status <- map["status"]
    }
}

class DataArray<T : Mappable> : Mappable {
    var data: [T]!
    var status: Int!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["data"]
        status <- map["status"]
    }
}

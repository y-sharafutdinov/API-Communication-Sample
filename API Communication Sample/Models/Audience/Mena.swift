//
//  Mena.swift
//  API Communication Sample
//
//  Created by Yaroslav Sharafutdinov on 8/9/17.
//  Copyright © 2017 Sample. All rights reserved.
//

import Foundation
import ObjectMapper

class Mena: Mappable {
    var size: Float!
    var percantage: Float!
    
    required init(map: Map) {
        
    }
    
    func mapping(map: Map) {
        size <- map["size"]
        percantage <- map["percantage"]
    }
}

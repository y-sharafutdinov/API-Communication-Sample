//
//  AudienceGrowth.swift
//  API Communication Sample
//
//  Created by Yaroslav Sharafutdinov on 8/9/17.
//  Copyright © 2017 Sample. All rights reserved.
//

import Foundation
import ObjectMapper

class AudienceGrowth: Mappable {
    var date: String!
    var mena: Mena!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        date <- map["date"]
        mena <- map["mena"]
    }
}

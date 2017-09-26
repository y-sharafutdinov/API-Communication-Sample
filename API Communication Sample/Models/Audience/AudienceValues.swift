//
//  AudienceValues.swift
//  API Communication Sample
//
//  Created by Yaroslav Sharafutdinov on 8/9/17.
//  Copyright © 2017 Sample. All rights reserved.
//

import Foundation
import ObjectMapper

class AudienceValues: Mappable {
    var menaSize: Float!
    var menaPercentage: Float!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        menaSize <- map["mena_size"]
        menaPercentage <- map["mena_percentage"]
    }
}

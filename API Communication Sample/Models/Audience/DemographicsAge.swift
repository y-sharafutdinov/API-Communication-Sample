//
//  DemographicsAge.swift
//  API Communication Sample
//
//  Created by Yaroslav Sharafutdinov on 8/9/17.
//  Copyright © 2017 Sample. All rights reserved.
//

import Foundation
import ObjectMapper

class DemographicsAge: Mappable {
    var ageGroup: AgeGroup?
    var value: Float!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        ageGroup <- (map["age_group"], EnumTransform<AgeGroup>())
        value <- map["value"]
    }
}

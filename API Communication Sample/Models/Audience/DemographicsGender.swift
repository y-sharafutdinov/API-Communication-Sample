//
//  DemographicsGender.swift
//  API Communication Sample
//
//  Created by Yaroslav Sharafutdinov on 8/9/17.
//  Copyright © 2017 Sample. All rights reserved.
//

import Foundation
import ObjectMapper

class DemographicsGender: Mappable {
    var male: Float!
    var female: Float!

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        male <- map["male"]
        female <- map["female"]
    }
}

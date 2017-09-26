//
//  Score.swift
//  Sample
//
//  Created by Yaroslav Sharafutdinov on 8/9/17.
//  Copyright © 2017 Sample. All rights reserved.
//

import Foundation
import ObjectMapper

class Score : Mappable {
    var score: Float!
    var status: Int!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        score <- map["score"]
        status <- map["status"]
    }
}

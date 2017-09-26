//
//  ScoresData.swift
//  Sample
//
//  Created by Yaroslav Sharafutdinov on 8/9/17.
//  Copyright © 2017 Sample. All rights reserved.
//

import Foundation
import ObjectMapper

extension Array {
    mutating func append(_ newElement: Element?) {
        if let element = newElement {
            self.append(element)
        }
    }
}

class ScoresData : Mappable {
    var quality: ScoreItem?
    var consistency: ScoreItem?
    var discovery: ScoreItem?
    var consumption: ScoreItem?
    var stickiness: ScoreItem?
    var engagement: ScoreItem?
    var amplification: ScoreItem?
    
    var items: [ScoreItem] {
        var array = [ScoreItem]()
        array.append(quality)
        array.append(consistency)
        array.append(discovery)
        array.append(consumption)
        array.append(stickiness)
        array.append(engagement)
        array.append(amplification)
        return array
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        quality <- map["quality"]
        quality?.type = .quality
        
        consistency <- map["consistency"]
        consistency?.type = .consistency
        
        discovery <- map["discovery"]
        discovery?.type = .discovery
        
        consumption <- map["consumption"]
        consumption?.type = .consumption
        
        stickiness <- map["stickiness"]
        stickiness?.type = .stickiness
        
        engagement <- map["engagement"]
        engagement?.type = .engagement
        
        amplification <- map["amplification"]
        amplification?.type = .amplification
    }
}

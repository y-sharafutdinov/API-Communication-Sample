//
//  ScoreItem.swift
//  Sample
//
//  Created by Yaroslav Sharafutdinov on 8/9/17.
//  Copyright © 2017 Sample. All rights reserved.
//

import Foundation
import ObjectMapper
import UIKit

class ScoreItem: Score {
    var video: Score?
    var photo: Score?
    var link: Score?
    var type: ItemType = .unknonw
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        video <- map["video"]
        photo <- map["photo"]
        link <- map["link"]
    }
    
    enum ItemType {
        case quality
        case consistency
        case discovery
        case consumption
        case stickiness
        case engagement
        case amplification
        
        case unknonw
        
        var title: String {
            switch self {
            case .quality:
                return "Quality"
            case .consistency:
                return "Consistency"
            case .discovery:
                return "Discovery"
            case .consumption:
                return "Consumption"
            case .stickiness:
                return "Stickiness"
            case .engagement:
                return "Engagement"
            case .amplification:
                return "Amplification"
                
            case .unknonw:
                return "Unknown"
            }
        }
        
        var color: UIColor {
            switch self {
            case .quality:
                return UIColor(argbValue: 0xFF212121)
            case .discovery:
                return UIColor(argbValue: 0xFFBE9DED)
            case .consumption:
                return UIColor(argbValue: 0xFFFFC65C)
            case .stickiness:
                return UIColor(argbValue: 0xFFABEC01)
            case .engagement:
                return UIColor(argbValue: 0xFFEF3C79)
            case .amplification:
                return UIColor(argbValue: 0xFF01BBD6)
            default:
                return .black
            }
        }
    }
}

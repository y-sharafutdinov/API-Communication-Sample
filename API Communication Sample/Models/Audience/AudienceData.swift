//
//  AudienceData.swift
//  API Communication Sample
//
//  Created by Yaroslav Sharafutdinov on 8/9/17.
//  Copyright © 2017 Sample. All rights reserved.
//

import Foundation

struct AudienceData {
    var values: AudienceValues
    var growth: [AudienceGrowth]
    var age: [DemographicsAge]
    var gender: DemographicsGender
}

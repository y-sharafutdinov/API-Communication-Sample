//
//  UIColor.swift
//  API Communication Sample
//
//  Created by Yaroslav Sharafutdinov on 8/9/17.
//  Copyright © 2017 Sample. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {
    convenience init(argbValue: Int) {
        self.init(red: (CGFloat)((argbValue & 0x00FF00) >> 8) / 255.0,
                  green: (CGFloat)((argbValue & 0x00FF00) >> 8) / 255.0,
                  blue: (CGFloat)((argbValue & 0x0000FF) >> 0) / 255.0,
                  alpha: (CGFloat)((argbValue & 0xFF000000) >> 24) / 255.0)
    }
}

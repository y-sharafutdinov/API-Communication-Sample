//
//  NSMutableAttributedString.swift
//  API Communication Sample
//
//  Created by Yaroslav Sharafutdinov on 8/9/17.
//  Copyright © 2017 Sample. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    @discardableResult func bold(_ text: String, size: CGFloat = 17, color: UIColor? = nil) -> NSMutableAttributedString {
        var attrs:[String:AnyObject] = [NSFontAttributeName : UIFont.systemFont(ofSize: size, weight: UIFontWeightBold)]
        if let color = color {
            attrs[NSForegroundColorAttributeName] = color
        }
        let boldString = NSMutableAttributedString(string:"\(text)", attributes:attrs)
        self.append(boldString)
        return self
    }
    
    @discardableResult func normal(_ text: String, size: CGFloat = 17, color: UIColor? = nil) -> NSMutableAttributedString {
        var attrs:[String:AnyObject] = [NSFontAttributeName : UIFont.systemFont(ofSize: size, weight: UIFontWeightRegular)]
        if let color = color {
            attrs[NSForegroundColorAttributeName] = color
        }
        let normal =  NSAttributedString(string: text, attributes:attrs)
        self.append(normal)
        return self
    }
}

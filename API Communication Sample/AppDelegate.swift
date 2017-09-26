//
//  AppDelegate.swift
//  API Communication Sample
//
//  Created by Yaroslav Sharafutdinov on 8/9/17.
//  Copyright © 2017 Sample. All rights reserved.
//

import UIKit
import AlamofireNetworkActivityIndicator

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        NetworkActivityLogger.shared.level = .debug
        NetworkActivityLogger.shared.startLogging()
        
        NetworkActivityIndicatorManager.shared.isEnabled = true
        
        return true
    }
}


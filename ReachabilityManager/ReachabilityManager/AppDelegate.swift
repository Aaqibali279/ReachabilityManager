//
//  AppDelegate.swift
//  ReachabilityManager
//
//  Created by Aquib on 30/07/19.
//  Copyright © 2019 Aquib. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        ReachabilityManager.instance.vc = window?.rootViewController
        return true
    }

}


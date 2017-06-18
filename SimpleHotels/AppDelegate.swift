//
//  AppDelegate.swift
//  SimpleHotels
//
//  Created by Paul Kite on 6/18/17.
//  Copyright © 2017 Expedia, Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: NSObject, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIViewController(nibName: nil, bundle: nil)
        window?.rootViewController?.view.backgroundColor = .white
        window?.makeKeyAndVisible()

        return true
    }
}

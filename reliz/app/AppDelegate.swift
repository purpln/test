//
//  AppDelegate.swift
//  reliz
//
//  Created by Sergey Romanenko on 05.07.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = NavigationController(rootViewController: MainViewController())
        window!.makeKeyAndVisible()
        return true
    }
}


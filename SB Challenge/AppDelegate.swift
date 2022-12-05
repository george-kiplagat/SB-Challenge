//
//  AppDelegate.swift
//  SB Challenge
//
//  Created by George Kiplagat on 03/12/2022.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator : AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        sleep(2)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.overrideUserInterfaceStyle = .light
        let navigationCon = UINavigationController.init()
        appCoordinator = AppCoordinator(navigationController: navigationCon)
        appCoordinator!.start()

        window!.rootViewController = navigationCon
        window!.makeKeyAndVisible()
        
        return true
        
    }

}


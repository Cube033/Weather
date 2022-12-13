//
//  AppDelegate.swift
//  Weather
//
//  Created by Дмитрий Федотов on 12.12.2022.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow()
    lazy var mainCoordinator = MainCoordinator(window: window!)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        mainCoordinator.startApplication()
        
        return true
    }
}


//
//  MainCoordinator.swift
//  Weather
//
//  Created by Дмитрий Федотов on 13.12.2022.
//

import Foundation
import UIKit

enum CoordinatorActionType {
    case startApplication
    case successLogin
    case openFilesList
    case openSettings
    case changePassword
}

class MainCoordinator {
    
    var navigationController: UINavigationController = UINavigationController()

    var window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func handleAction(actionType: CoordinatorActionType) {
        switch actionType {
        case .startApplication:
            startApplication()
        case .successLogin:
           // successLogin()
           break
        default: break
            
        }
    }
    
    func startApplication(){
        if SettingsManager.shared.onboardingIsCleared {
            let viewController = CitiesPageController()
            //viewController.coordinatorOpt = self
            navigationController.setViewControllers([viewController], animated: true)
            self.window?.rootViewController = navigationController
        } else {
            let viewController = OnBoardingViewController(coordinator: self)
            self.window?.rootViewController = viewController
        }
        self.window?.makeKeyAndVisible()
    }
    
}

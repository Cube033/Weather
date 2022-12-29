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
            let viewController = CitiesPageController(mainCoordinator: self)
            //viewController.navController = navigationController
            navigationController.setViewControllers([viewController], animated: true)
            //viewController.setControllersArray(navigationController: navigationController)
            window?.overrideUserInterfaceStyle = .light
            self.window?.rootViewController = navigationController
        } else {
            let viewController = OnBoardingViewController(coordinator: self)
            self.window?.rootViewController = viewController
        }
        self.window?.makeKeyAndVisible()
    }
    
    func addCityButtonTapped(viewController: UIViewController) {
        let cityNamePicker = CityNamePicker()
        cityNamePicker.getCityName(showIn: viewController, completion: {(cityNameText: String) in
            NetworkManager.shared.getCityByName(name: cityNameText, completion:
                                                    {(cityDataOptional) in
                if let cityData = cityDataOptional {
                    let operationResult = StorageManager.shared.addNewCity(cityData: cityData)
                    DispatchQueue.main.async {
                        var messageText: String
                        switch operationResult {
                        case .success(let checkIsSuccess):
                            messageText = checkIsSuccess
                        case .failure(let loginError):
                            messageText = loginError
                        }
                        CityNamePicker.setAlert(showIn: viewController, textMessage: messageText)
                    }
                } else {
                    DispatchQueue.main.async {
                        CityNamePicker.setAlert(showIn: viewController, textMessage: "Произошла ошибка")
                    }
                }
            })
        })
    } 
    
}

//
//  SettingsManager.swift
//  Weather
//
//  Created by Дмитрий Федотов on 13.12.2022.
//

import Foundation

class SettingsManager {
    
    static let shared = SettingsManager()
    let userDefaults = UserDefaults.standard
    
    var onboardingIsCleared: Bool {
        get {
            return userDefaults.bool(forKey: "onboardingIsCleared")
        }
        set {
            userDefaults.set(newValue, forKey: "onboardingIsCleared")
        }
    }
}

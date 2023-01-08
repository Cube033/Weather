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
    
    var tempetatureFormat: TemperatureFormat {
        get {
            if userDefaults.string(forKey: "tempetatureFormat") == "fahrenheit" {
                return .fahrenheit
            } else {
                return .celsius //default
            }
        }
        set {
            if newValue == .fahrenheit {
                userDefaults.set("fahrenheit", forKey: "tempetatureFormat")
            } else {
                userDefaults.set("celsius", forKey: "tempetatureFormat")
            }
        }
    }
    
    var timeFormat: TimeFormat {
        get {
            if userDefaults.string(forKey: "timeFormat") == "format12" {
                return .format12
            } else {
                return .format24 //default
            }
        }
        set {
            if newValue == .format12 {
                userDefaults.set("format12", forKey: "timeFormat")
            } else {
                userDefaults.set("format24", forKey: "timeFormat")
            }
        }
    }
    
    var measurementType: MeasurementType {
        get {
            if userDefaults.string(forKey: "measurementType") == "miles" {
                return .miles
            } else {
                return .kilometers //default
            }
        }
        set {
            if newValue == .miles {
                userDefaults.set("miles", forKey: "measurementType")
            } else {
                userDefaults.set("kilometers", forKey: "measurementType")
            }
        }
    }
    
    var notificationsIsOn: Bool {
        get {
            return userDefaults.bool(forKey: "notificationsIsOn")
        }
        set {
            userDefaults.set(newValue, forKey: "notificationsIsOn")
        }
    }
}

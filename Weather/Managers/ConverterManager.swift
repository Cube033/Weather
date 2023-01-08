//
//  ConverterManager.swift
//  Weather
//
//  Created by Дмитрий Федотов on 08.01.2023.
//

import Foundation

class ConverterManager {
    
    static var shared = ConverterManager()
    
    func getWeatherFromFarenheit(farenheit: Double) -> Double {
        let currentFormat = SettingsManager.shared.tempetatureFormat
        switch currentFormat {
        case .celsius:
            return 5 / 9 * (farenheit - 32)
        case .fahrenheit:
            return farenheit
        }
    }
}

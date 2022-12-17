//
//  WeatherIconManager.swift
//  Weather
//
//  Created by Дмитрий Федотов on 17.12.2022.
//

import Foundation
import UIKit

class WeatherIconManager {
    
//    static let shared = WeatherIconManager()
    
    static func getIcon(for weatherState: WeatherState) -> UIImage {
        switch weatherState {
        case .sun:
            return UIImage(named: "weatherIconSun") ?? UIImage()
        case .rain:
            return UIImage(named: "weatherIconSun") ?? UIImage()
//        default:
//            return UIImage()
        }
    }
}

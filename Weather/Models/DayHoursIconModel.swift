//
//  DayHoursModel.swift
//  Weather
//
//  Created by Дмитрий Федотов on 16.12.2022.
//

import Foundation

enum WeatherState {
    case sun
    case rain
}

struct HourIconModel {
    var hour: Int
    var hourDescription: String
    var weatherState: WeatherState
    var temp: Int
    
    static func getEmptyModel() -> HourIconModel {
        return HourIconModel(hour: 0, hourDescription: "00:00", weatherState: .sun, temp: 0)
    }
}

struct DayHoursIconModel {
    var hoursArray: [HourIconModel]
    
    static func getEmptyModel() -> DayHoursIconModel {
        var newHoursArray: [HourIconModel] = []
        for _ in 0...23 {
            newHoursArray.append(HourIconModel.getEmptyModel())
        }
        return DayHoursIconModel(hoursArray: newHoursArray)
    }
}

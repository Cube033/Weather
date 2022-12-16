//
//  MiniDayModel.swift
//  Weather
//
//  Created by Дмитрий Федотов on 15.12.2022.
//

import Foundation

struct DayMiniModel {
    
    var minTemp: Int
    var maxTemp: Int
    var curTemp: Int
    var weatherDescription: String
    var windSpeed: Int
    var humidity: Int
    var precipitation: Int
    var dayDescription: String
    var sunriseTime: String
    var sunsetTime: String
    
    static func getEmptyModel() -> DayMiniModel {
        return DayMiniModel(minTemp: 0, maxTemp: 0, curTemp: 0, weatherDescription: "Weather description", windSpeed: 0, humidity: 0, precipitation: 0, dayDescription: Date().description, sunriseTime: "00:00", sunsetTime: "00:00")
    }
}

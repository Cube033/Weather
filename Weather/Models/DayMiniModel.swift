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
    var dayShortDescription: String
    
    static func getEmptyModel() -> DayMiniModel {
        return DayMiniModel(minTemp: 0, maxTemp: 0, curTemp: 0, weatherDescription: "Weather description", windSpeed: 0, humidity: 0, precipitation: 0, dayDescription: Date().description, sunriseTime: "00:00", sunsetTime: "00:00", dayShortDescription: "01/01")
    }
    
    static func getModelByCurrentWeather(currentWeather: CurrentWeatherModelCodable) -> DayMiniModel {
        
//        let minTemp = ConverterManager.shared.getWeatherFromFarenheit(farenheit: currentWeather.main.tempMin)
//        let maxTemp = ConverterManager.shared.getWeatherFromFarenheit(farenheit: currentWeather.main.tempMax)
//        let curTemp = ConverterManager.shared.getWeatherFromFarenheit(farenheit: currentWeather.main.temp)
        
        return DayMiniModel(minTemp: Int(currentWeather.main.tempMin),
                            maxTemp: Int(currentWeather.main.tempMax),
                            curTemp: Int(currentWeather.main.temp),
                            weatherDescription: currentWeather.weather.description,
                            windSpeed: Int(currentWeather.wind.speed),
                            humidity: currentWeather.main.humidity,
                            precipitation: 0,
                            dayDescription: Date().description,
                            sunriseTime: "00:00",
                            sunsetTime: "00:00",
                            dayShortDescription: "01/01")
    }
}

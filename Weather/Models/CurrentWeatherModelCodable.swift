//
//  CurrentWeatherModelCodable.swift
//  Weather
//
//  Created by Дмитрий Федотов on 28.12.2022.
//

import Foundation



//{
//"coord": {
//"lon": 10.99,
//"lat": 44.34
//},
//"weather": [
//{
//"id": 501,
//"main": "Rain",
//"description": "moderate rain",
//"icon": "10d"
//}
//],
//"base": "stations",
//"main": {
//"temp": 298.48,
//"feels_like": 298.74,
//"temp_min": 297.56,
//"temp_max": 300.05,
//"pressure": 1015,
//"humidity": 64,
//"sea_level": 1015,
//"grnd_level": 933
//},
//"visibility": 10000,
//"wind": {
//"speed": 0.62,
//"deg": 349,
//"gust": 1.18
//},
//"rain": {
//"1h": 3.16
//},
//"clouds": {
//"all": 100
//},
//"dt": 1661870592,
//"sys": {
//"type": 2,
//"id": 2075663,
//"country": "IT",
//"sunrise": 1661834187,
//"sunset": 1661882248
//},
//"timezone": 7200,
//"id": 3163858,
//"name": "Zocca",
//"cod": 200
//}



struct CurrentWeatherModelCodable: Codable {
    var weather: [CurrentWeatherModelCodableWeather]
    var base: String
    var main: CurrentWeatherModelCodableMain
    var visibility: Int
    var wind : CurrentWeatherModelCodableWind
    var clouds: CurrentWeatherModelCodableClouds
    var dt: Int
    var sys: CurrentWeatherModelCodableSys
    var timezone: Int
    var id: Int
    var name: String
    var cod: Int
}

struct CurrentWeatherModelCodableWeather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct CurrentWeatherModelCodableMain: Codable {
    var temp: Double
    var feelsLike: Double
    var tempMin: Double
    var tempMax: Double
    var pressure: Int
    var humidity: Int
   // var seaLevel: Int
   // var grndLevel: Int
}

struct CurrentWeatherModelCodableWind: Codable {
    var speed: Double
    var deg: Int
    //var gust: Double
}

struct CurrentWeatherModelCodableClouds: Codable {
    var all: Int
}
struct CurrentWeatherModelCodableSys: Codable {
    var type: Int
    var id: Int
    var country: String
    var sunrise: Int
    var sunset: Int
}
struct CurrentWeatherModelCodableCoordinate: Codable {
    var lon: Double
    var lat: Double
}

//
//  NetworkManager.swift
//  Weather
//
//  Created by Дмитрий Федотов on 28.12.2022.
//

import Foundation

//7ce6971dfd0b691b1cb9cf369a92d7e6

class NetworkManager {
    
    static var shared = NetworkManager()
    
    let session = URLSession(configuration: .default)
    
    func getCityByName(name: String, completion: ((_ cityDataCodable: CityDataCodable?)->Void)?) {
        guard let encodedName = name.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) else {
            print("ошибка преобразования")
            return
        }
        let urlString = "http://api.openweathermap.org/geo/1.0/direct?q=\(encodedName)&limit=5&appid=7ce6971dfd0b691b1cb9cf369a92d7e6"
        
        let urlOpt = URL(string: urlString)
        
        guard let url = urlOpt else {
            print(urlString)
            return
        }
        let task = session.dataTask(with: url) { data, responce, error in
            if let error = error {
                print(error)
                completion?(nil)
                return
            }
            guard let data = data else {
                print("data is nil")
                completion?(nil)
                return
            }
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let cityDataArray = try jsonDecoder.decode([CityDataCodable].self, from: data)
                completion?(cityDataArray.count > 0 ? cityDataArray[0] : nil)
            } catch {
                completion?(nil)
                return
            }
        }
        task.resume()
    }
    
    func getCurrentWeather(cityData: CityDataCodable, completion: ((_ currentWeatherModelCodable: CurrentWeatherModelCodable?)->Void)?) {
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(cityData.lat)&lon=\(cityData.lon)&appid=7ce6971dfd0b691b1cb9cf369a92d7e6"
        
        guard let urlStringEnc = urlString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) else {
            print("🐙 ошибка преобразования")
            return
        }
        
        let urlOpt = URL(string: urlStringEnc)
        
        guard let url = urlOpt else {
            print("🌕\(urlString)")
            return
        }
        let task = session.dataTask(with: url) { data, responce, error in
            if let error = error {
                print("🦊\(error)")
                completion?(nil)
                return
            }
            guard let data = data else {
                print("🍀data is nil")
                completion?(nil)
                return
            }
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let currentWeather = try jsonDecoder.decode(CurrentWeatherModelCodable.self, from: data)
                print("🐠\(currentWeather)")
                completion?(currentWeather)
            } catch {
                print("🏝\(error)")
                completion?(nil)
                return
            }
        }
        task.resume()
    }
}

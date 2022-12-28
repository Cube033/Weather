//
//  StorageManager.swift
//  Weather
//
//  Created by Дмитрий Федотов on 13.12.2022.
//

import Foundation

class StorageManager {
    
    static let shared = StorageManager()
    
    func getCities() -> [String] {
        
        return ["Kemerowo","Tomsk","Berlin"]
    }
    
    func addNewCity(cityData: CityDataCodable) {
        print("Добавлен город \(cityData.name)")
    }
    
}

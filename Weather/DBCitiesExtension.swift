//
//  DBCitiesExtension.swift
//  Weather
//
//  Created by Дмитрий Федотов on 28.12.2022.
//

import CoreData

extension DBCities {
    
    func convertToCityDataCodable() -> CityDataCodable {
        var cityData = CityDataCodable(name: cityName ?? "",
                                       localNames: LocalNameCodable(ru: cityLabel ?? ""),
                                   lat: latitude,
                                   lon: longitude,
                                   country: "")
        return cityData
    }
    
}

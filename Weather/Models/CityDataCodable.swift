//
//  CityDataCodable.swift
//  Weather
//
//  Created by Дмитрий Федотов on 28.12.2022.
//

import Foundation

struct LocalNameCodable: Codable {
    var ru: String
}

struct CityDataCodable: Codable {
    var name: String
    var localNames: LocalNameCodable
    var lat: Double
    var lon: Double
    var country: String
}

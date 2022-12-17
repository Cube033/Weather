//
//  CityDaysModel.swift
//  Weather
//
//  Created by Дмитрий Федотов on 17.12.2022.
//

import Foundation

struct CityDaysModel {
    var daysArray: [DayMiniModel]
    
    static func getEmptyModel() -> CityDaysModel {
        var newDaysArray: [DayMiniModel] = []
        for _ in 0...6 {
            newDaysArray.append(DayMiniModel.getEmptyModel())
        }
        return CityDaysModel(daysArray: newDaysArray)
    }
}

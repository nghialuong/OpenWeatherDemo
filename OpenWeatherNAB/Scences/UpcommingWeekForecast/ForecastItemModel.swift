//
//  WeatherItem.swift
//  OpenWeatherNAB
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation

struct ForecastItemModel {
    let date: Int
    let temparture: Double
    let pressure: Int
    let humidity: Int
    let description: String
    
    init(forecast: Forescast) {
        self.date = forecast.date
        self.temparture = forecast.avgTempature
        self.pressure = forecast.pressure
        self.humidity = forecast.humidity
        self.description = forecast.description
    }
}

extension ForecastItemModel {
    func dateToString() -> String {
        return "thu 7 ngay 13"
    }
    
    func tempartureToString() -> String {
        return "36 do C"
    }
    
    func pressureToString() -> String {
        return "20"
    }
    
    func humitidyToString() -> String {
        return "38%"
    }
    
}

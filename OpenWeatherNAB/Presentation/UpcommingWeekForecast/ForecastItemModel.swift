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
    
    init(forecast: Forecast) {
        self.date = forecast.date
        self.temparture = forecast.avgTempature
        self.pressure = forecast.pressure
        self.humidity = forecast.humidity
        self.description = forecast.description
    }
}

extension ForecastItemModel {
    func dateToString() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self.date))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "E, d MMM yyyy"
        return "Date: \(dateFormatter.string(from: date))"
    }
    
    func tempartureToString() -> String {
        return "Average Tempature: \(Int(temparture))°C"
    }
    
    func pressureToString() -> String {
        return "Pressure: \(pressure)"
    }
    
    func humitidyToString() -> String {
        return "Humidity: \(humidity)%"
    }
    
    func descriptionToString() -> String {
        return "Description: \(description)"
    }
    
}

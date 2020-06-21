//
//  WeatherItem.swift
//  OpenWeatherNAB
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation

class ForecastItem {
    let cod: String
    init(forecastDailyData: ForecastDailyData) {
        self.cod = forecastDailyData.cod ?? ""
        print(forecastDailyData)
    }
}

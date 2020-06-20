//
//  WeatherItem.swift
//  OpenWeatherNAB
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation

class WeatherItem {
    let cod: String
    init(weatherDailyResult: WeatherDailyResult) {
        self.cod = weatherDailyResult.cod
        print(weatherDailyResult.cod)
    }
}

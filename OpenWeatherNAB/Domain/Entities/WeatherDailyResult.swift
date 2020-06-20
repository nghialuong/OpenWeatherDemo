//
//  WeatherDailyResult.swift
//  OpenWeatherNAB
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation

struct WeatherDailyResult: Codable {
    let city: City
    let cod: String
    let message: Double
    let cnt: Int
    let list: [List]
}

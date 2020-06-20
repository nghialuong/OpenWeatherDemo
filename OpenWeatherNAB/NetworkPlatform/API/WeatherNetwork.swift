//
//  WeatherNetwork.swift
//  OpenWeatherNAB
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation
import RxSwift

final class WeatherNetwork {
    private let network: Network<WeatherDailyResult>
    
    init(network: Network<WeatherDailyResult>) {
        self.network = network
    }
    
    public func fetchUpcommingWeekWeather(for location: String) -> Observable<[WeatherDailyResult]> {
        return self.network.getUpcommingWeather(for: location, path: "")
    }
}

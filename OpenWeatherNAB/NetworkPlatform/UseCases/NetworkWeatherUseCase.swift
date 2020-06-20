//
//  NetworkWeatherUseCase.swift
//  OpenWeatherNAB
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation
import RxSwift

final class NetworkWeatherUseCase: WeatherUseCases {
    
    private let network: WeatherNetwork
//    private let cache: Cache

    init(network: WeatherNetwork) {
        self.network = network
//        self.cache = cache
    }
    
    func getUpcommingWeekWeather(for location: String) -> Observable<[WeatherDailyResult]> {
        return network.fetchUpcommingWeekWeather(for: location)
    }
    
}

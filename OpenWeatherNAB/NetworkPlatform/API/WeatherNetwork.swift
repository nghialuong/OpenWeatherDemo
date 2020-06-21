//
//  WeatherNetwork.swift
//  OpenWeatherNAB
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation
import RxSwift

final class WeatherNetwork: WeatherUseCases {
    private let network: Network<WeatherWeekResult>
    
    init(network: Network<WeatherWeekResult>) {
        self.network = network
    }
    
    func getUpcommingWeekWeather(for location: String) -> Observable<WeatherWeekResult> {
        return self.network.getUpcommingWeekWeather(for: location, path: "")
    }
}

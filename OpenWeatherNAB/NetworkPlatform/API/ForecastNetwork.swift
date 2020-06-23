//
//  WeatherNetwork.swift
//  OpenWeatherNAB
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation
import RxSwift

final class ForecastNetwork: ForecastUseCase {

    private let path = "forecast"
    private let network: Network
    
    init(network: Network) {
        self.network = network
    }
    
    func getUpcomingWeekForecast(for location: String) -> Observable<[Forescast]> {
        return self.network.getUpcomingWeekForecast(for: location, path: path)
    }
}

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
    
    func getUpcommingWeekForecast(for location: String) -> Observable<[Forescast]> {
        return self.network.getUpcommingWeekForecast(for: location, path: path)
    }
}

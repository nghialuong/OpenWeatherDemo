//
//  NetworkWeatherUseCase.swift
//  OpenWeatherNAB
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation
import RxSwift

final class NetworkForecastUseCase: ForecastUseCase {
    private let network: ForecastNetwork

    init(network: ForecastNetwork) {
        self.network = network
    }
    
    func getUpcommingWeekForecast(for location: String) -> Observable<[Forescast]> {
        return network.getUpcommingWeekForecast(for: location)
    }
}

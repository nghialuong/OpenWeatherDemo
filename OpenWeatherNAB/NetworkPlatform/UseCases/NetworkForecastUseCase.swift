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
//    private let cache: Cache

    init(network: ForecastNetwork) {
        self.network = network
//        self.cache = cache
    }
    
    func getUpcommingWeekForecast(for location: String) -> Observable<[Forescast]> {
        return network.getUpcommingWeekForecast(for: location)
    }
    
}

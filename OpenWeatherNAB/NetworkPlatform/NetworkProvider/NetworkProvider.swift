//
//  NetworkProvider.swift
//  OpenWeatherNAB
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation

final class NetworkProvider {
    private let apiEndpoint: String
    
    init() {
        apiEndpoint = "https://api.openweathermap.org"
    }
    
    func makeForecastUseCase() -> ForecastNetwork {
        let network = Network(endPoint: apiEndpoint)
        return ForecastNetwork(network: network)
    }
}

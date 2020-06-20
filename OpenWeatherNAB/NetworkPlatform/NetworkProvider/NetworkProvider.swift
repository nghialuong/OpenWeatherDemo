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

    public init() {
        apiEndpoint = "https://api.openweathermap.org"
    }
    
    public func makeWeatherNetwork() -> WeatherNetwork {
        let network = Network<WeatherDailyResult>(endPoint: apiEndpoint)
        return WeatherNetwork(network: network)
    }
}

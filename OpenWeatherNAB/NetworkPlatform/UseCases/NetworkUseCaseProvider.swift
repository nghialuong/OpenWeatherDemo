//
//  UseCaseProvider.swift
//  OpenWeatherNAB
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation

final class NetworkUseCaseProvider: UseCaseProvider {
    
    private let networkProvider: NetworkProvider
    
    public init() {
        networkProvider = NetworkProvider()
    }
    
    public func makeWeatherUseCase() -> WeatherUseCases {
        return NetworkWeatherUseCase(network: networkProvider.makeWeatherNetwork())
    }
    
}

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
    
    init() {
        networkProvider = NetworkProvider()
    }
    
    func makeForecastUseCase() -> ForecastUseCase {
        return NetworkForecastUseCase(network: networkProvider.makeForecastUseCase())
    }
}

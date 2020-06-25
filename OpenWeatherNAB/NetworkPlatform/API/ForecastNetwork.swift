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
    private let cache: Cache<String, [Forecast]>
    
    init(network: Network) {
        self.network = network
        self.cache = Cache<String, [Forecast]>()
    }
    
    func getUpcomingWeekForecast(for location: String) -> Observable<[Forecast]> {
        if let forecastItems = cache.value(forKey: location.lowercased()) {
            return Observable.just(forecastItems)
        }
        let forecastItems = self.network.getUpcomingWeekForecast(for: location, path: path)
            .do(onNext: { [unowned self] items in
                self.cache.insert(items, forKey: location.lowercased(), lifeTime: self.cacheLifeTime())
            })
        return forecastItems
    }
}

extension ForecastNetwork {
    private func cacheLifeTime() -> TimeInterval {
        let now = Date()
        let nowSince1970 = now.timeIntervalSince1970
        let calendar = Calendar.current
        if let tomorrow = calendar.date(byAdding: .day, value: 1, to: now) {
            let lastSecondOfToday = calendar.startOfDay(for: tomorrow).timeIntervalSince1970 - 1
            return lastSecondOfToday - nowSince1970
        }
        return 0
    }
}

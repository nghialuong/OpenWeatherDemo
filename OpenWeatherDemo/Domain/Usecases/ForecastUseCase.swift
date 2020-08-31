//
//  WeatherUseCases.swift
//  OpenWeatherDemo
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation
import RxSwift

protocol ForecastUseCase {
    func getUpcomingWeekForecast(for location: String) -> Observable<[Forecast]>
}

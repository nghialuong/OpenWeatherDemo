//
//  WeatherUseCases.swift
//  OpenWeatherNAB
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation
import RxSwift

protocol ForecastUseCase {
    func getUpcommingWeekForecast(for location: String) -> Observable<[Forescast]>
}

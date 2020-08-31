//
//  WeatherListViewModel.swift
//  OpenWeatherNAB
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

final class UpcommingWeekForecastViewModel: ViewModelType {
    let forecastUseCase: ForecastUseCase
    
    init(useCase: ForecastUseCase) {
        self.forecastUseCase = useCase
    }
    
    func transform(input: Input) -> Output {
        let upcommingWeekForecast = input.searchTrigger
            .flatMapLatest({ [unowned self] searchText in
                return self.forecastUseCase.getUpcommingWeekForecast(for: searchText)
                    .asDriverOnErrorJustComplete()
                    .map { $0.map { ForecastItemModel(forecast: $0) } }
            })
        return Output(upcommingWeekForecast: upcommingWeekForecast)
    }
}

extension UpcommingWeekForecastViewModel {
    struct Input {
        let searchTrigger: Driver<String>
    }
    
    struct Output {
        let upcommingWeekForecast: Driver<[ForecastItemModel]>
    }
}

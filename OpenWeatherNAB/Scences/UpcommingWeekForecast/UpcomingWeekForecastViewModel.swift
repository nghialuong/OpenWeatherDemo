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

final class UpcomingWeekForecastViewModel: ViewModelType {
    let forecastUseCase: ForecastUseCase
    
    init(useCase: ForecastUseCase) {
        self.forecastUseCase = useCase
    }
    
    func transform(input: Input) -> Output {
        
        let errorTracker = ErrorTracker()
        let upcomingWeekForecast = input.searchTrigger
            .flatMapLatest({ [unowned self] searchText in
                return self.forecastUseCase.getUpcomingWeekForecast(for: searchText)
                    .trackError(errorTracker)
                    .asDriverOnErrorJustComplete()
                    .map { $0.map { ForecastItemModel(forecast: $0) } }
            })
        
        return Output(upcomingWeekForecast: upcomingWeekForecast,
                      error: errorTracker.asDriver())
    }
}

extension UpcomingWeekForecastViewModel {
    struct Input {
        let searchTrigger: Driver<String>
    }
    
    struct Output {
        let upcomingWeekForecast: Driver<[ForecastItemModel]>
        let error: Driver<Error>
    }
}

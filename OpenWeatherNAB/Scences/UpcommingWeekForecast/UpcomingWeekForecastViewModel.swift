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
    let errorTrigger = PublishSubject<ApiError>()
    
    init(useCase: ForecastUseCase) {
        self.forecastUseCase = useCase
    }
    
    func transform(input: Input) -> Output {
        let upcomingWeekForecast = input.searchTrigger
            .flatMap { [unowned self] searchText in
                return self.forecastUseCase.getUpcomingWeekForecast(for: searchText)
                    .do(onError: { error in
                        if let error = error as? ApiError {
                            self.errorTrigger.onNext(error)
                        } else {
                         print("Something is wrong")
                        }
                    })
                    .asDriverOnErrorJustComplete()
                    .map { $0.map { ForecastItemModel(forecast: $0) } }
        }
        
        return Output(upcomingWeekForecast: upcomingWeekForecast,
                      error: errorTrigger.asDriverOnErrorJustComplete())
    }
}

extension UpcomingWeekForecastViewModel {
    struct Input {
        let searchTrigger: Driver<String>
        let noSearchingTrigger: Driver<Void>
    }
    
    struct Output {
        let upcomingWeekForecast: Driver<[ForecastItemModel]>
        let error: Driver<ApiError>
    }
}

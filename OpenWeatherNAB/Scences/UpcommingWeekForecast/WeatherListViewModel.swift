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
    
    let weatherUseCase: ForecastUseCase
    //    let navigator:
    
    init(useCase: ForecastUseCase) {
        self.weatherUseCase = useCase
    }
    
    func transform(input: Input) -> Output {
        let weatherInfo = input.searchTrigger
            .flatMapLatest({ [unowned self] searchText in
                return self.weatherUseCase.getUpcommingWeekForecast(for: searchText ?? "")
                    .asDriverOnErrorJustComplete()
                    .map {
                        WeatherItem(weatherDailyResult: $0)
                }
            })
        return  Output(weatherInfo: weatherInfo)
    }
    
}

extension UpcommingWeekForecastViewModel {
    struct Input {
        //        let trigger: Driver<Void>
        let searchTrigger: Driver<String>
    }
    
    struct Output {
        let weatherInfo: Driver<WeatherItem>
    }
}

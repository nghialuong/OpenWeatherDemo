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

final class WeatherListViewModel: ViewModelType {
    
    let weatherUseCase: WeatherUseCases
    //    let navigator:
    
    init(useCase: WeatherUseCases) {
        self.weatherUseCase = useCase
    }
    
    func transform(input: Input) -> Output {
        let weatherInfo = input.trigger
            .flatMapLatest {
                return self.weatherUseCase.getUpcommingWeekWeather(for: "saigon")
                    .asDriverOnErrorJustComplete()
                    .map {
                        WeatherItem(weatherDailyResult: $0)
                }
        }
        
        return  Output(weatherInfo: weatherInfo)
    }
    
}

extension WeatherListViewModel {
    struct Input {
        let trigger: Driver<Void>
    }
    
    struct Output {
        let weatherInfo: Driver<WeatherItem>
    }
}

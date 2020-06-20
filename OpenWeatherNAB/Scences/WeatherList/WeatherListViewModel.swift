//
//  WeatherListViewModel.swift
//  OpenWeatherNAB
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation
import RxCocoa

final class WeatherListViewModel: ViewModelType {
    
    let weatherUseCase: WeatherUseCases
    //    let navigator:
    
    init(useCase: WeatherUseCases) {
        self.weatherUseCase = useCase
    }
    
    func transform(input: Input) -> Output {
        _ = input.trigger
            .do(onNext: { [unowned self] _ in
                self.weatherUseCase.getUpcommingWeekWeather(for: "saigon")
            })
        return  Output()
    }
    
}

extension WeatherListViewModel {
    struct Input {
        let trigger: Driver<Void>
    }
    
    struct Output {
    }
}

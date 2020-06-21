//
//  WeatherNavigator.swift
//  OpenWeatherNAB
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation
import UIKit

protocol UpcommingWeekForecastNavigatorProtocol {
    func upcommingWeekForecastVC() -> UIViewController
}

class UpcommingWeekForecastNavigator: UpcommingWeekForecastNavigatorProtocol {
    
    private let storyboard: UIStoryboard
    private let services: UseCaseProvider
    
    init(storyboard: UIStoryboard, services: UseCaseProvider) {
        self.storyboard = storyboard
        self.services = services
    }
    
    func upcommingWeekForecastVC() -> UIViewController {
        let viewcontroller = storyboard.instantiateViewController(identifier: "UpcommingWeekForecastViewController") as UpcommingWeekForecastViewController
        viewcontroller.viewModel = UpcommingWeekForecastViewModel(useCase: services.makeWeatherUseCase())
        return viewcontroller
    }
    
}

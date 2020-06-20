//
//  WeatherNavigator.swift
//  OpenWeatherNAB
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation
import UIKit

protocol WeatherListNavigator {
    func weatherList() -> UIViewController
}

class WeatherNavigator: WeatherListNavigator {
    
    private let storyboard: UIStoryboard
    private let services: UseCaseProvider
    
    init(storyboard: UIStoryboard, services: UseCaseProvider) {
        self.storyboard = storyboard
        self.services = services
    }
    
    func weatherList() -> UIViewController {
        let viewcontroller = storyboard.instantiateViewController(identifier: "WeatherListViewController") as WeatherListViewController
        viewcontroller.viewModel = WeatherListViewModel(useCase: services.makeWeatherUseCase())
        return viewcontroller
    }
    
}

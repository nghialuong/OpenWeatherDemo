//
//  WeatherNavigator.swift
//  OpenWeatherNAB
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation
import UIKit

protocol UpcomingWeekForecastNavigatorProtocol {
    func upcomingWeekForecastVC() -> UIViewController
}

final class UpcomingWeekForecastNavigator: UpcomingWeekForecastNavigatorProtocol {
    private let storyboard: UIStoryboard
    private let services: UseCaseProvider
    
    init(storyboard: UIStoryboard, services: UseCaseProvider) {
        self.storyboard = storyboard
        self.services = services
    }
    
    func upcomingWeekForecastVC() -> UIViewController {
        let viewcontroller = storyboard.instantiateViewController(identifier: "UpcomingWeekForecastViewController") as UpcomingWeekForecastViewController
        viewcontroller.viewModel = UpcomingWeekForecastViewModel(useCase: services.makeForecastUseCase())
        return viewcontroller
    }
    
}

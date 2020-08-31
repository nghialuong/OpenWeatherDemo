//
//  Application.swift
//  OpenWeatherDemo
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import UIKit

final class Application {
    static let shared = Application()
    let networkUsecaseProvider = NetworkUseCaseProvider()

    func configureMainInterface(in window: UIWindow) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigation = UINavigationController(rootViewController: UpcomingWeekForecastNavigator(storyboard: storyboard, services: networkUsecaseProvider).upcomingWeekForecastVC())
        window.rootViewController = navigation
        window.makeKeyAndVisible()
    }
}

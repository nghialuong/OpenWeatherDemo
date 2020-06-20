//
//  Application.swift
//  OpenWeatherNAB
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import UIKit

final class Application {
    static let shared = Application()

    func configureMainInterface(in window: UIWindow) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        window.rootViewController = storyboard.instantiateViewController(identifier: "ViewController")
        window.makeKeyAndVisible()
    }
}

//
//  ForecastItemModelTest.swift
//  OpenWeatherNABTests
//
//  Created by Luong Nghia on 6/24/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import XCTest

@testable import OpenWeatherNAB

class ForecastItemModelTests: XCTestCase {
    var itemModel: ForecastItemModel!
    
    override func setUp() {
        let forecast = Forescast(date: 1592971200, avgTempature: 26, pressure: 1009, humidity: 67, description: "light rain")
        itemModel = ForecastItemModel(forecast: forecast)
    }
    
    func test_forecastItemModel() {
        XCTAssertEqual(itemModel.dateToString(), "Wed, 24 Jun 2020")
        XCTAssertEqual(itemModel.tempartureToString(), "26°C")
        XCTAssertEqual(itemModel.pressureToString(), "1009")
        XCTAssertEqual(itemModel.humitidyToString(), "67%")
        XCTAssertEqual(itemModel.description, "light rain")
    }
}

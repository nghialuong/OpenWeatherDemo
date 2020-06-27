//
//  CacheTests.swift
//  OpenWeatherNABTests
//
//  Created by Luong Nghia on 6/25/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import XCTest

@testable import OpenWeatherNAB

class CacheTests: XCTestCase {
    var cache: Cache<String, [Forecast]>!
    
    override func setUp() {
        super.setUp()
        cache = Cache<String, [Forecast]>()
    }
    
    func test_getUnsavedData() {
        let forecastItems = [
            Forecast(date: 1593095734, avgTempature: 23, pressure: 44, humidity: 23, description: "lgihtly rain")
        ]
        cache.insert(forecastItems, forKey: "newyork", lifeTime: 3)
        
        let value = cache.value(forKey: "sapa")
        XCTAssertNil(value)
    }
    
    func test_clearObjectWhenExpired() {
        let forecastItems = [
            Forecast(date: 1593095734, avgTempature: 23, pressure: 44, humidity: 23, description: "lgihtly rain")
        ]
        let location = "newyork"
        cache.insert(forecastItems, forKey: location, lifeTime: 3)
        // we should make life time < sleep time
        sleep(4)
        let value = cache.value(forKey: location)
        XCTAssertNil(value)
    }
}

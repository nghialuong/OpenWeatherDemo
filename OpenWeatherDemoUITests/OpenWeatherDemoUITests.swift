//
//  OpenWeatherDemoUITests.swift
//  OpenWeatherDemoUITests
//
//  Created by Luong Nghia on 6/27/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import XCTest

class OpenWeatherDemoUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
    }
    
    func test_searchByCitySuccess() {
        app.searchFields["City name"].tap()
        app.searchFields["City name"].typeText("sai gon")
        sleep(3)
        XCTAssertEqual(app.tables.cells.count, 7)
    }
    
    func test_cityNotFound() {
        app.searchFields["City name"].tap()
        app.searchFields["City name"].typeText("999")
        sleep(3)
        XCTAssertTrue(app.alerts["City Not Found"].exists)
    }
    
}

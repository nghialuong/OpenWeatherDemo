//
//  UpcommingWeekForecastTests.swift
//  OpenWeatherNABTests
//
//  Created by Luong Nghia on 6/22/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import XCTest
import RxCocoa
import RxSwift
import RxTest
import RxBlocking

@testable import OpenWeatherNAB

class UpcommingWeekForecastTests: XCTestCase {
    var viewModel: UpcommingWeekForecastViewModel!
    var scheduler: TestScheduler!
    var disposeBag: DisposeBag!
    
    override func setUp() {
        let networkUseCase = NetworkUseCaseProvider()
        viewModel = UpcommingWeekForecastViewModel(useCase: networkUseCase.makeForecastUseCase())
        scheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
    }
    
    func test_searchForecastByLocation() {
        let forecastItems = scheduler.createObserver([ForecastItemModel].self)
        let searchTrigger = scheduler.createColdObservable([.next(10, "saigon"),
                                                            .completed(20)])
            .asDriverOnErrorJustComplete()
        
        let input = UpcommingWeekForecastViewModel.Input(searchTrigger: searchTrigger)
        let output = viewModel.transform(input: input)
        output.upcommingWeekForecast
            .drive(forecastItems)
            .disposed(by: disposeBag)
        
        scheduler.start()
        
        XCTAssertEqual(try output.upcommingWeekForecast.toBlocking().single().count, 7)
    }
}


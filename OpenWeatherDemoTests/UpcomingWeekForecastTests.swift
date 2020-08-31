//
//  UpcomingWeekForecastTests.swift
//  OpenWeatherDemoTests
//
//  Created by Luong Nghia on 6/22/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import XCTest
import RxCocoa
import RxSwift
import RxTest
import RxBlocking

@testable import OpenWeatherDemo

class UpcomingWeekForecastTests: XCTestCase {
    var viewModel: UpcomingWeekForecastViewModel!
    var scheduler: TestScheduler!
    var disposeBag: DisposeBag!
    
    override func setUp() {
        super.setUp()
        let networkUseCase = NetworkUseCaseProvider()
        viewModel = UpcomingWeekForecastViewModel(useCase: networkUseCase.makeForecastUseCase())
        scheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
    }
    
    func test_searchForecastByLocationSuccess() {
        let forecastItems = scheduler.createObserver([ForecastItemModel].self)
        let searchTrigger = scheduler.createColdObservable([.next(10, "saigon"),
                                                            .completed(20)])
            .asDriverOnErrorJustComplete()
        
        let input = UpcomingWeekForecastViewModel.Input(searchTrigger: searchTrigger, clearSearchTrigger: Driver.empty())
        let output = viewModel.transform(input: input)
        output.upcomingWeekForecast
            .drive(forecastItems)
            .disposed(by: disposeBag)
        
        scheduler.start()
        
        XCTAssertEqual(try output.upcomingWeekForecast.toBlocking().single().count, 7)
    }
    
    func test_searchForecastByLocationFailureCityNotFound() {
        let searchTrigger = scheduler.createColdObservable([.next(10, "99999"),
                                                            .completed(20)])
            .asDriverOnErrorJustComplete()
        
        let input = UpcomingWeekForecastViewModel.Input(searchTrigger: searchTrigger, clearSearchTrigger: Driver.empty())
        let output = viewModel.transform(input: input)
        
        output.upcomingWeekForecast
            .drive()
            .disposed(by: disposeBag)
        
        output.error
            .drive()
            .disposed(by: disposeBag)
        
        scheduler.start()
        XCTAssertEqual(try output.error.toBlocking().first(), ApiError.cityNotFound)
        
    }
}


//
//  Networkl.swift
//  OpenWeatherDemo
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire

final class Network {
    private let apiID = "60c6fbeb4b93ac653c492ba806fc346d"
    private let apiVersion = "2.5"
    private let endPoint: String
    private let scheduler: ConcurrentDispatchQueueScheduler
    
    init(endPoint: String) {
        self.endPoint = endPoint
        self.scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))
    }
    
    func getUpcomingWeekForecast(for location: String, path: String) -> Observable<[Forecast]> {
        let absolutePath = "\(endPoint)/data/\(apiVersion)/\(path)/daily?q=\(location.lowercased())&cnt=7&appid=\(apiID)&units=metric"
        return RxAlamofire
            .requestData(.get, absolutePath)
            .debug()
            .observeOn(scheduler)
            .expectingObject(ofType: WeekForecastData.self)
            .map { $0.list.map { Forecast(date: $0.dt, avgTempature: $0.temp.day,
                                           pressure: $0.pressure,
                                           humidity: $0.humidity,
                                           description: $0.weather[0].weatherDescription) }
        }
    }
}

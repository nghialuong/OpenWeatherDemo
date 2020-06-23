//
//  Networkl.swift
//  OpenWeatherNAB
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire

final class Network {
    static private let apiID = "60c6fbeb4b93ac653c492ba806fc346d"
    static private let apiVersion = "2.5"
    private let endPoint: String
    private let scheduler: ConcurrentDispatchQueueScheduler
    
    init(endPoint: String) {
        self.endPoint = endPoint
        self.scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))
    }
    
    func getUpcomingWeekForecast(for location: String, path: String) -> Observable<[Forescast]> {
        let absolutePath = "\(endPoint)/data/\(Network.apiVersion)/\(path)/daily?q=\(location.lowercased())&cnt=7&appid=\(Network.apiID)&units=metric"
        return RxAlamofire
            .requestData(.get, absolutePath)
            .debug()
            .observeOn(scheduler)
            .map { response, data in
                if 200 ..< 300 ~= response.statusCode {
                    let forecastData = try JSONDecoder().decode(WeekForecastData.self, from: data)
                    return forecastData.list.map { Forescast(date: $0.dt, avgTempature: $0.temp.day,
                                                             pressure: $0.pressure,
                                                             humidity: $0.humidity,
                                                             description: $0.weather[0].weatherDescription) }
                } else if response.statusCode == 401 {
                    throw ApiError.invalidKey
                } else if 400 ..< 500 ~= response.statusCode {
                    throw ApiError.cityNotFound
                } else {
                    throw ApiError.serverFailure
                }
        }
    }
}

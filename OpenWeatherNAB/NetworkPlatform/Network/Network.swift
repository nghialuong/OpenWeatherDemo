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

final class Network<T: Decodable> {
    private let endPoint: String
    private let scheduler: ConcurrentDispatchQueueScheduler
    
    init(endPoint: String) {
        self.endPoint = endPoint
        self.scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))
    }
    
    func getUpcommingWeekWeather(for location: String, path: String) -> Observable<T> {
        let absolutePath = "https://api.openweathermap.org/data/2.5/forecast/daily?q=saigon&cnt=7&appid=60c6fbeb4b93ac653c492ba806fc346d&units=metric"
        return RxAlamofire
            .data(.get, absolutePath)
            .debug()
            .observeOn(scheduler)
            .map({ data -> T in
                return try JSONDecoder().decode(T.self, from: data)
            })
    }
    
}

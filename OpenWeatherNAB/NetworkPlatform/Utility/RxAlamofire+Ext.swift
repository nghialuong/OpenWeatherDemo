//
//  RxAlamofire+Ext.swift
//  OpenWeatherNAB
//
//  Created by Luong Nghia on 6/25/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation
import RxSwift

extension Observable where Element == (HTTPURLResponse, Data) {
    
    func expectingObject<T : Codable>(ofType type: T.Type) -> Observable<T> {
        return self.map{ httpURLResponse, data -> T in
            switch httpURLResponse.statusCode {
            case 200 ..< 300:
                do {
                    let object = try JSONDecoder().decode(type, from: data)
                    return object
                } catch  {
                    throw ApiError.other
                }
            case 401:
                throw ApiError.invalidKey
            case 400 ..< 500:
                throw ApiError.cityNotFound
            default:
                throw ApiError.serverFailure
            }
        }
    }
}

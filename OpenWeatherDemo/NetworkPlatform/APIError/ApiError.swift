//
//  ApiError.swift
//  OpenWeatherDemo
//
//  Created by Luong Nghia on 6/23/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation

enum ApiError: Error {
    case cityNotFound
    case serverFailure
    case invalidKey
    case other
    
    var description: String {
        switch self {
        case .cityNotFound:
            return "City Not Found"
        case .serverFailure:
            return "Server Failure"
        case .invalidKey:
            return "Invalid Key"
        case .other:
            return "Something is wrong"
        }
    }
}

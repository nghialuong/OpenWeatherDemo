//
//  Cache.swift
//  OpenWeatherNAB
//
//  Created by Luong Nghia on 6/24/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation
import RxSwift

final class Cache<Key: Hashable, Value> {
    private let wrapped = NSCache<WrappedKey, Entry>()
    
    init(maximumEntryCount: Int = 50) {
        wrapped.countLimit = maximumEntryCount
    }

    func insert(_ value: Value, forKey key: Key, lifeTime: TimeInterval) {
        let now = Date()
        let expiredDate = now.addingTimeInterval(lifeTime)
        let entry = Entry(key: key, value: value, expirationDate: expiredDate, startDate: now)
        wrapped.setObject(entry, forKey: WrappedKey(key))
    }
    
    func value(forKey key: Key) -> Value? {
        guard let entry = wrapped.object(forKey: WrappedKey(key)) else {
            return nil
        }
        
        guard Date() < entry.expirationDate else {
            // Discard values that have expired
            removeValue(forKey: key)
            return nil
        }
        
        return entry.value
    }
    
    func removeValue(forKey key: Key) {
        wrapped.removeObject(forKey: WrappedKey(key))
    }
}

extension Cache {
    final class WrappedKey: NSObject {
        let key: Key
        
        init(_ key: Key) { self.key = key }
        
        override var hash: Int { return key.hashValue }
        
        override func isEqual(_ object: Any?) -> Bool {
            guard let value = object as? WrappedKey else {
                return false
            }
            
            return value.key == key
        }
    }
}

extension Cache {
    final class Entry {
        let key: Key
        let value: Value
        let startDate: Date
        let expirationDate: Date
        
        init(key: Key, value: Value, expirationDate: Date, startDate: Date) {
            self.key = key
            self.value = value
            self.expirationDate = expirationDate
            self.startDate = startDate
        }
    }
}


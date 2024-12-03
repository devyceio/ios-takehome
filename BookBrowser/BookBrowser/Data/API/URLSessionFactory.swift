//
//  URLSessionFactory.swift
//  DevyceTest
//
//  Created by Vitalii Harshyn on 02.12.2024.
//

import Foundation

extension URLSession {

    static func newInstance() -> URLSession {
        let memoryCapacity = 10 * 1024 * 1024
        let diskCapacity = 100 * 1024 * 1024
        let timeout = 30.0
        
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        configuration.timeoutIntervalForRequest = timeout
        let urlCache = URLCache(memoryCapacity: memoryCapacity, diskCapacity: diskCapacity)
        configuration.urlCache = urlCache
        
        return URLSession(configuration: configuration)
    }
}

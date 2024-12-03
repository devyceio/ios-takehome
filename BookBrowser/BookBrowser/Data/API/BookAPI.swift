//
//  BookAPI.swift
//  DevyceTest
//
//  Created by Vitalii Harshyn on 03.12.2024.
//
import Foundation

/**
 https://www.dbooks.org/api/
 **/
enum BookAPI {
    
    case recent
    case details(id: String)
    case search(query: String)
    
    private var path: String {
        switch self {
        case .recent:
            return "/api/recent"
        case .details(let id):
            return "/api/book/\(id)"
        case .search(let query):
            return "/api/search/\(query)"
        }
    }
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.dbooks.org"
        components.path = path
        return components.url
    }
}

//
//  BookError.swift
//  DevyceTest
//
//  Created by Vitalii Harshyn on 02.12.2024.
//

enum BookError: Error {
    
    case malformedUrl
    case unexpected
    case unknown
    
    var title: String {
        switch self {
        case .malformedUrl:
            return "Invalid URL"
        case .unexpected:
            return "Unexpected data"
        case .unknown:
            return "Unknown Error"
        }
    }
    
    var message: String {
        switch self {
        case .malformedUrl:
            return "The url was invalid"
        case .unexpected:
            return "Received unexpected data"
        case .unknown:
            return "Something went wrong"
        }
    }
}
